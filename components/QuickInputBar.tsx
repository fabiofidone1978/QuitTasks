import React, { useState } from 'react';
import { View } from 'react-native';
import { TextInput, Button } from 'react-native-paper';
import { useTaskStore } from '../store/taskStore';
import { parseTaskInput } from '../services/nlpService';
import { Task } from '../types/tasks';

export default function QuickInputBar() {
  const [input, setInput] = useState('');
  const addTask = useTaskStore((state) => state.addTask);

  const handleAddTask = () => {
    if (input.trim()) {
      const parsed = parseTaskInput(input);
      const newTask: Task = {
        id: Date.now().toString(),
        title: parsed.title || input,
        bucket: parsed.bucket,
        context: parsed.context,
        tags: parsed.tags,
        rawInput: input,
        createdAt: Date.now(),
        completed: false,
      };
      addTask(newTask);
      setInput('');
    }
  };

  return (
    <View style={{ flexDirection: 'row', gap: 8, alignItems: 'center' }}>
      <TextInput
        placeholder="Inserisci task"
        value={input}
        onChangeText={setInput}
        style={{ flex: 1 }}
      />
      <Button mode="contained-tonal" onPress={handleAddTask}>
        +
      </Button>
    </View>
  );
}
