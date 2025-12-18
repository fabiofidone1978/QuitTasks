export type TaskBucket = 'today' | 'later';
export type TaskContext = 'personal' | 'work' | 'home';

export interface Task {
  id: string;
  title: string;
  bucket: TaskBucket;
  context: TaskContext;
  tags: string[];
  rawInput: string;
  createdAt: number;
  completed: boolean;
}
