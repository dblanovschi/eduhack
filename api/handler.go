package api

import (
	"fmt"
	"github.com/dblanovschi/eduhack/db"
	"github.com/gin-gonic/gin"
	"strconv"
)

func HandlerResources(c *gin.Context) {
	id, idPresent := c.GetQuery("id")
	name, namePresent := c.GetQuery("name")

	if idPresent {
		realId, err := strconv.Atoi(id)
		if err != nil {
			_ = c.AbortWithError(400, err)
			return
		}
		resource, err := db.GetResourceById(realId)

		if err != nil {
			if err.Error() == "sql: no rows in result set" {
				_ = c.AbortWithError(404, err)
				return
			} else {
				_ = c.AbortWithError(500, err)
				return
			}
		}

		if resource != nil {
			v := *resource
			c.JSON(200, v)
		}
	} else if namePresent {
		resource, err := db.GetResourceByName(name)

		if err != nil {
			if err.Error() == "sql: no rows in result set" {
				_ = c.AbortWithError(404, err)
				return
			} else {
				_ = c.AbortWithError(500, err)
				return
			}
		}

		if resource != nil {
			v := *resource
			c.JSON(200, v)
		}
	} else {
		resources, err := db.GetAllResources()
		if err != nil {
			_ = c.AbortWithError(500, err)
			return
		}

		c.JSON(200, resources)
	}
}

func HandlerExercises(c *gin.Context) {
	idResource, present := c.GetQuery("id")
	if !present {
		_ = c.AbortWithError(400, fmt.Errorf("missing id for /api/exercises"))
		return
	}

	id, err := strconv.Atoi(idResource)
	if err != nil {
		_ = c.AbortWithError(400, err)
		return
	}

	exercises, err := db.GetExercisesForResource(id)

	c.JSON(200, exercises)
}
