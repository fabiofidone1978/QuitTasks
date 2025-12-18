import { TaskBucket, TaskContext } from '../types/tasks';

export interface ParsedTask {
  title: string;
  bucket: TaskBucket;
  context: TaskContext;
  tags: string[];
}

export const parseTaskInput = (text: string): ParsedTask => {
  let title = text;
  let bucket: TaskBucket = 'later';
  let context: TaskContext = 'personal';
  const tags: string[] = [];

  // Parse per bucket (oggi/today, dopo/later)
  if (/\b(oggi|today|t)\b/i.test(text)) {
    bucket = 'today';
  }

  // Parse per context (@work, @home, @personal)
  const contextMatch = text.match(/@(\w+)/g);
  if (contextMatch) {
    const ctx = contextMatch[0].substring(1).toLowerCase();
    if (ctx === 'work' || ctx === 'home' || ctx === 'personal') {
      context = ctx as TaskContext;
    }
  }

  // Parse per tags (#tag)
  const tagMatches = text.match(/#(\w+)/g);
  if (tagMatches) {
    tags.push(...tagMatches.map((tag) => tag.substring(1)));
  }

  // Rimuovi gli speciali dal titolo
  title = text
    .replace(/@\w+/g, '')
    .replace(/#\w+/g, '')
    .replace(/\b(oggi|today|t)\b/gi, '')
    .trim();

  return { title, bucket, context, tags };
};
