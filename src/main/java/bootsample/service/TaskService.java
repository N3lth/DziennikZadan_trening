package bootsample.service;

import java.util.List;
import java.util.ArrayList;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import bootsample.dao.TaskRepository;
import bootsample.model.Task;


@Service
@Transactional
public class TaskService {

	private final TaskRepository taskRepository;

	public TaskService(TaskRepository taskRepository) {
		this.taskRepository = taskRepository;
	}
	
	public List<Task> findAll(){ 						// znajdz wszystkie
		List<Task> tasks = new ArrayList<>(); 			// stworz liste
		for (Task task : taskRepository.findAll()){ 	// dla kazdego tasku, jaki znajdziesz z repozytorium (.findAll() jest z interfejsu z extendem CrudRepository!!)
			tasks.add(task);                        	// dodaj task do listy
		}
		return tasks;
	}
	
	public Task findTask(int id){
		return taskRepository.findOne(id);
	}
	
	public void save(Task task){
		taskRepository.save(task);
	}
	
	public void delete (int id){
		taskRepository.delete(id);
	}

}
