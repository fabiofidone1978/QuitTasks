# QuitTasks - Architecture & Best Practices

## Architettura

### Layered Architecture

```
┌─────────────────────────────────┐
│        Screens (UI Layer)       │
│  HomeScreen, AddTask, Settings  │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│      Components (UI Layer)      │
│      TaskItem, QuickInputBar    │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│     Services (Business Logic)   │
│      nlpService, iapService     │
└──────────────┬──────────────────┘
               │
┌──────────────▼──────────────────┐
│    Store (State Management)     │
│         Zustand Store           │
└─────────────────────────────────┘
```

## State Management (Zustand)

### Store Pattern
```typescript
// ✅ Good
export const useTaskStore = create<TaskStore>((set, get) => ({
  tasks: [],
  addTask: (task) => {
    set((state) => ({
      tasks: [...state.tasks, task],
    }));
  },
}));

// ✅ Usage in components
const tasks = useTaskStore((state) => state.tasks);
const addTask = useTaskStore((state) => state.addTask);
```

### Why Zustand?
- Lightweight (2KB gzipped)
- TypeScript-first
- No boilerplate
- Easy testing

## Typing Strategy

### Task Types
```typescript
export interface Task {
  id: string;           // Unique identifier
  title: string;        // Parsed title
  bucket: 'today' | 'later';
  context: 'personal' | 'work' | 'home';
  tags: string[];       // User tags
  rawInput: string;     // Original input
  createdAt: number;    // Timestamp
  completed: boolean;
}
```

### Navigation Types
```typescript
export type RootStackParamList = {
  Home: undefined;
  AddTask: undefined;
  Settings: undefined;
};
```

## Code Style

### Naming Conventions

**Components**
```typescript
// ✅ PascalCase for components
export function TaskItem() {}
export default function HomeScreen() {}
```

**Functions & Variables**
```typescript
// ✅ camelCase for functions and variables
const handleAddTask = () => {}
const parseTaskInput = (text: string) => {}
```

**Types & Interfaces**
```typescript
// ✅ PascalCase for types
interface TaskStore {}
type TaskBucket = 'today' | 'later';
```

**Constants**
```typescript
// ✅ UPPER_SNAKE_CASE for constants
const MAX_TASK_LENGTH = 500;
const DEFAULT_CONTEXT = 'personal';
```

### Import Organization
```typescript
// ✅ Organized by source
import React from 'react';                              // External libraries
import { View } from 'react-native';
import { useTaskStore } from '../store/taskStore';     // Internal imports
import { Task } from '../types/tasks';
import TaskItem from '../components/TaskItem';
```

## Performance Guidelines

### Component Optimization
```typescript
// ✅ Memoization for expensive components
const TaskItem = React.memo(({ task }: TaskItemProps) => {
  // ...
});

// ✅ useMemo for expensive computations
const sortedTasks = useMemo(() => {
  return [...tasks].sort((a, b) => b.createdAt - a.createdAt);
}, [tasks]);
```

### Store Subscriptions
```typescript
// ✅ Selective subscription (no re-render if other state changes)
const tasks = useTaskStore((state) => state.tasks);

// ❌ Avoid subscribing to entire store
const store = useTaskStore(); // Re-renders on any state change
```

## Error Handling

### Try-Catch Pattern
```typescript
// ✅ Handle errors gracefully
const handleAddTask = () => {
  try {
    if (!input.trim()) {
      console.warn('Empty input');
      return;
    }
    const parsed = parseTaskInput(input);
    addTask(createTask(parsed));
  } catch (error) {
    console.error('Failed to add task:', error);
    // Show error to user
  }
};
```

## Testing Patterns

### Zustand Store Testing
```typescript
// ✅ Test store methods
describe('taskStore', () => {
  it('should add task', () => {
    const { result } = renderHook(() => useTaskStore());
    const newTask = createMockTask();
    act(() => {
      result.current.addTask(newTask);
    });
    expect(result.current.tasks).toContainEqual(newTask);
  });
});
```

### Component Testing
```typescript
// ✅ Test component with mocked store
jest.mock('../store/taskStore');
const mockAddTask = jest.fn();
useTaskStore.mockImplementation(() => ({
  addTask: mockAddTask,
}));

it('should call addTask on submit', () => {
  render(<AddTaskScreen />);
  fireEvent.press(screen.getByText('Salva'));
  expect(mockAddTask).toHaveBeenCalled();
});
```

## Git Workflow

### Branch Strategy (Git Flow)

```
main (v1.0.0) ──────────────────┐
     ↑                          │
     └──────────────────────────┘
          (merge PR)

develop (staging)
     ↑
     │
feature/add-notifications ──────┘
     ↑
     │
fix/parsing-bug ────────────────┘
```

### Commit Message Format
```
<type>(<scope>): <subject>

<body>

<footer>

# ✅ Examples
feat(store): add task deletion
fix(nlp): handle empty input
docs(readme): add setup instructions
chore(deps): update zustand to 4.5.2
```

## CI/CD Practices

### Before Pushing
```bash
npm run lint          # Type check
npx prettier --write . # Format
git status            # Check changes
```

### Pull Request Checklist
```markdown
- [ ] Code compiles with `npm run lint`
- [ ] No TypeScript errors
- [ ] Code is formatted with Prettier
- [ ] Tests pass (if applicable)
- [ ] PR description is clear
- [ ] Branch is up-to-date with develop
```

## Documentation

### JSDoc Comments
```typescript
/**
 * Parses natural language task input
 * @param text - Raw user input (e.g., "Buy milk @home #shopping oggi")
 * @returns Parsed task object
 * @example
 * const parsed = parseTaskInput("Call John @work today");
 * // Returns { title: "Call John", context: "work", bucket: "today", ... }
 */
export const parseTaskInput = (text: string): ParsedTask => {
  // implementation
};
```

### Type Documentation
```typescript
export type TaskBucket = 'today' | 'later';  // When: today or later

export type TaskContext = 'personal' | 'work' | 'home';  // Where/What context
```

## Security Best Practices

### Input Validation
```typescript
// ✅ Validate user input
const handleAddTask = (input: string) => {
  if (!input || input.trim().length === 0) return;
  if (input.length > MAX_TASK_LENGTH) {
    console.error('Input too long');
    return;
  }
  // Process safe input
};
```

### Sensitive Data
```typescript
// ✅ Don't store tokens in AsyncStorage directly
// Use Expo SecureStore instead
import * as SecureStore from 'expo-secure-store';

await SecureStore.setItemAsync('authToken', token);
const token = await SecureStore.getItemAsync('authToken');
```

## Future Enhancements

### Planned
- [ ] AsyncStorage for persistence
- [ ] Notifications (expo-notifications)
- [ ] IAP Integration
- [ ] Dark mode
- [ ] Search & Filter
- [ ] Task statistics
- [ ] Cloud sync

### Dependencies to Add
```bash
# Persistence
npm install @react-native-async-storage/async-storage

# Notifications
npm install expo-notifications

# Testing
npm install --save-dev jest @testing-library/react-native

# Additional UI
npm install react-native-reanimated
```

---

## Quick Reference

| Concern | Solution | File |
|---------|----------|------|
| State Management | Zustand | `store/taskStore.ts` |
| Type Safety | TypeScript strict | `tsconfig.json` |
| Code Quality | ESLint + Prettier | `.eslintrc.json`, `.prettierrc` |
| CI/CD | GitHub Actions | `.github/workflows/` |
| NLP | Custom parser | `services/nlpService.ts` |
| Navigation | React Navigation | `types/navigation.ts` |

---

*Last updated: December 18, 2025*
