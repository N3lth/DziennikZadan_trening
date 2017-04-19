package bootsample.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bootsample.model.Task;
import bootsample.service.TaskService;

@RestController // callujemy przez przegladarke, zwraca json object
public class SampleRestController {

	
	@Autowired
	private TaskService taskService;
	
	@GetMapping("/hello")  // ustalamy, ze jest to GET
	public String hello(){
	return "Hello controller!";
	}
//	
//	@GetMapping("/all-tasks")
//	public String allTasks(){
//		return taskService.findAll().toString();
//	}
//	
//	@GetMapping("/save-task")
//	public String saveTask(@RequestParam String name, @RequestParam String desc){
//		Task task = new Task(name, desc, new Date(), false);
//		taskService.save(task);
//		return "Task zapisany!";
//	}
//	
//	@GetMapping("/delete-task")
//	public String deleteTask(@RequestParam int id){
////		Task task = new Task(name, desc, new Date(), false);
//		taskService.delete(id);
//		return "Task usuniety!";
//	}
}
