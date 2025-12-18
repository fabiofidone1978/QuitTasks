import React, { useState } from 'react';
import { View } from 'react-native';
import { Button, TextInput } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';
import { useTaskStore } from '../store/taskStore';
import { parseTaskInput } from '../services/nlpService';
import { Task } from '../types/tasks';

export default function AddTaskScreen() {
  const navigation = useNavigation<any>();
  const [input, setInput] = useState('');
  const addTask = useTaskStore((state) => state.addTask);

  const handleSave = () => {
    if (input.trim()) {
      const parsed = parseTaskInput(input);
      const newTask: Task = {
        id: Date.now().toString(),
        title: parsed.title || input,
        bucket: parsed.bucket || 'later',
        context: parsed.context || 'personal',
        tags: parsed.tags || [],
        rawInput: input,
        createdAt: Date.now(),
        completed: false,
      };
      addTask(newTask);
      navigation.goBack();
    }
  };

  return (
    <View style={{ padding: 24, flex: 1 }}>
      <TextInput
        label="Nuovo Task"
        value={input}
        onChangeText={setInput}
        placeholder="Es: Comprare latte @home #shopping oggi"
        multiline
        numberOfLines={3}
        style={{ marginBottom: 16 }}
      />
      <Button mode="contained" onPress={handleSave} style={{ marginBottom: 8 }}>
        Salva
      </Button>
      <Button onPress={() => navigation.goBack()}>Annulla</Button>
    </View>
  );
}
