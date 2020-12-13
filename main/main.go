package main

import (
	"fmt"
	"github.com/dblanovschi/eduhack/api"
	"github.com/gin-gonic/contrib/static"
	"github.com/gin-gonic/gin"
	"gopkg.in/ini.v1"
	"io/ioutil"
	"log"
	"strconv"

	"github.com/dblanovschi/eduhack/config"
)

func main() {
	cfg, err := ini.Load("config.ini")

	if err != nil {
		log.Panic(err)
	}

	err = cfg.MapTo(&config.Config)

	router := gin.Default()

	fmt.Println("Public path:", config.Config.DataFolder + "/html/build")
	router.GET("/resource/:id", reactRoute)
	router.GET("/add-resource", reactRoute)
	router.Use(static.Serve("/", static.LocalFile(config.Config.DataFolder + "/html/build", true)))
	apiGroup := router.Group("/api")
	{
		apiGroup.GET("/resources", api.HandlerResources)
		apiGroup.GET("/exercises", api.HandlerExercises)
	}

	_ = router.Run(":" + strconv.Itoa(config.Config.PortToListenTo))
}

func reactRoute(context *gin.Context) {
	byts, err := ioutil.ReadFile(config.Config.DataFolder + "/html/build/index.html")

	if err != nil {
		context.AbortWithError(500, err)
		return
	}

	context.Data(200, "text/html", byts)
}
