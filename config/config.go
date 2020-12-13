package config

// Config The config
var Config struct {
	DataFolder     string `ini:"DataFolder"`
	PortToListenTo int    `ini:"PortToListenTo"`

	Database struct {
		Host     string `ini:"Host"`
		Port     int    `ini:"Port"`
		Name     string `ini:"Name"`
		User     string `ini:"User"`
		Password string `ini:"Password"`
		SSLMode  string `ini:"SSLMode"`
	} `ini:"Database"`
}