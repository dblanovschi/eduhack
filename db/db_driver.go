package db

import (
	"database/sql"
	"fmt"
	"github.com/dblanovschi/eduhack/config"
	"log"

	_ "github.com/go-sql-driver/mysql"
)

type Resource struct {
	Id          int    `json:"id"`
	Subject     string `json:"subject"`
	Grade       int    `json:"grade"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Markdown    string `json:"markdown"`
}

type Exercise struct {
	Id              int    `json:"id"`
	ResourceId      int    `json:"resource_id"`
	Name            string `json:"name"`
	DifficultyLevel int    `json:"difficulty_level"`
	Link            string `json:"link"`
}

func makeConnStr() string {
	return fmt.Sprintf("%s:%s@/%s",
		config.Config.Database.User,
		config.Config.Database.Password,
		config.Config.Database.Name,
	)
}

/*OpenDB opens a connection to the database*/
func OpenDB() *sql.DB {
	db, err := sql.Open("mysql", makeConnStr())
	if err != nil {
		log.Panic(err)
	}
	return db
}

func GetResourceByName(name string) (*Resource, error) {
	db := OpenDB()
	defer db.Close()

	row := db.QueryRow("SELECT id, subject, grade, res_name, description, markdown FROM resources WHERE res_name = ?;", name)

	if row == nil {
		return nil, fmt.Errorf("no such resource")
	}

	var id = 0
	var subject = ""
	var grade = 0
	var resName = ""
	var description = ""
	var html = ""
	err := row.Scan(&id, &subject, &grade, &resName, &description, &html)

	if err != nil {
		return nil, err
	}

	return &Resource{
		Id:          id,
		Subject:     subject,
		Grade:       grade,
		Name:        resName,
		Description: description,
		Markdown:    html,
	}, nil
}

func GetResourceById(id int) (*Resource, error) {
	db := OpenDB()
	defer db.Close()

	row := db.QueryRow("SELECT subject, grade, res_name, description, markdown FROM resources WHERE id = ?;", id)

	if row == nil {
		return nil, fmt.Errorf("no such resource")
	}

	var subject = ""
	var grade = 0
	var resName = ""
	var description = ""
	var markdown = ""
	err := row.Scan(&subject, &grade, &resName, &description, &markdown)

	if err != nil {
		return nil, err
	}

	return &Resource{
		Id:          id,
		Subject:     subject,
		Grade:       grade,
		Name:        resName,
		Description: description,
		Markdown:    markdown,
	}, nil
}

func GetAllResources() ([]Resource, error) {
	db := OpenDB()
	defer db.Close()

	rows, err := db.Query("SELECT id, subject, grade, res_name, description, markdown FROM resources;")

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	resources := make([]Resource, 0)
	for rows.Next() {
		var id = 0
		var subject = ""
		var grade = 0
		var resName = ""
		var description = ""
		var markdown = ""
		err := rows.Scan(&id, &subject, &grade, &resName, &description, &markdown)

		if err != nil {
			return nil, err
		}

		resources = append(resources, Resource{
			Id:          id,
			Subject:     subject,
			Grade:       grade,
			Name:        resName,
			Description: description,
			Markdown:    markdown,
		})
	}

	return resources, nil
}

func GetExercisesForResource(resourceId int) ([]Exercise, error) {
	db := OpenDB()
	defer db.Close()

	rows, err := db.Query("SELECT id, resource_id, name, difficulty_level, link FROM exercises WHERE resource_id = ?;", resourceId)

	if err != nil {
		return nil, err
	}

	defer rows.Close()

	exercises := make([]Exercise, 0)

	for rows.Next() {
		var id = 0
		var resId = 0
		var name = ""
		var difficultyLevel = 0
		var link = ""

		err = rows.Scan(&id, &resId, &name, &difficultyLevel, &link)

		if err != nil {
			continue
		}

		exercises = append(exercises, Exercise{
			Id:              id,
			ResourceId:      resId,
			Name:            name,
			DifficultyLevel: difficultyLevel,
			Link:            link,
		})
	}

	return exercises, nil
}
