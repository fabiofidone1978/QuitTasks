import { create } from 'zustand';
import { Task } from '../types/tasks';

interface TaskStore {
  tasks: Task[];
  addTask: (task: Task) => void;
  removeTask: (id: string) => void;
  toggleTask: (id: string) => void;
  getTasks: () => Task[];
}

export const useTaskStore = create<TaskStore>((set, get) => ({
  tasks: [],
  addTask: (task: Task) => {
    set((state) => ({
      tasks: [...state.tasks, task],
    }));
  },
  removeTask: (id: string) => {
    set((state) => ({
      tasks: state.tasks.filter((task) => task.id !== id),
    }));
  },
  toggleTask: (id: string) => {
    set((state) => ({
      tasks: state.tasks.map((task) =>
        task.id === id ? { ...task, completed: !task.completed } : task
      ),
    }));
  },
  getTasks: () => get().tasks,
}));
