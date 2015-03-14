package main
import (
	"fmt"
	"net/http"
	"encoding/json"
	//"io/ioutil"
)

type Section struct {
	URL string
	Title string
	Time string
}

type ClassSimapleInfo struct {
	ID int
	Name string
	IconUrl string
	Score int
	Teacher string
	Price int
	StudentCount int
}

func SayClassSimapleInfo(w http.ResponseWriter, req *http.Request) {
	var info ClassSimapleInfo
	info.ID = 1
	info.Name = "Java 教程"
	info.IconUrl = "http://localhost:8080/images/java.jpg"
	info.Score = 80
	info.Price = 5000
	info.StudentCount = 50
	info.Teacher = "陈老师"

	var result = [5] ClassSimapleInfo{}
	for i:=0; i < len(result); i++ {
		info.ID = i
		info.Name = fmt.Sprintf("Java 教程(%d)", i)
		result[i] = info
	}

	body, err := json.Marshal(result)
	if err != nil {
		panic(err.Error)
	}
	w.Write([]byte(body))
}

func ClassCategory(w http.ResponseWriter, req *http.Request) {
	var result = [] string {"Java", "C++", "C语言", "C#", "Android开发", "IOS开发", "Swift 开发"}
	body, err := json.Marshal(result)
	if err != nil {
		panic(err.Error)
	}
	w.Write([]byte(body))
}

func Sections(w http.ResponseWriter, req *http.Request) {
	var times = [] string {"22:22", "27:22"}
	var urls = [] string {"www.baidu.com", "www.163.com"}
	var titles = [] string {"第一章", "第二章"}
	var result = [2] Section{}
	for i:=0; i < 2; i++ {
		var s Section
		s.URL = urls[i]
		s.Time = times[i]
		s.Title = titles[i]
		result[i] = s
	}
	body, err := json.Marshal(result)
	if err != nil {
		panic(err.Error)
	}
	w.Write([]byte(body))
}

func main() {
	http.HandleFunc("/class1", SayClassSimapleInfo)
	http.HandleFunc("/class2", ClassCategory)
	http.HandleFunc("/sections", Sections)
	http.ListenAndServe(":8081", nil)
}
