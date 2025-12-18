import React, { useMemo } from 'react';
import { View, FlatList } from 'react-native';
import { Button, Text } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';
import { useTaskStore } from '../store/taskStore';
import TaskItem from '../components/TaskItem';

export default function HomeScreen() {
  const navigation = useNavigation<any>();
  const tasks = useTaskStore((state) => state.tasks);
  
  const sortedTasks = useMemo(() => {
    return [...tasks].sort((a, b) => b.createdAt - a.createdAt);
  }, [tasks]);

  return (
    <View style={{ flex: 1, padding: 24 }}>
      <Text variant="headlineMedium">QuietTasks</Text>
      <Button mode="contained" onPress={() => navigation.navigate('AddTask')} style={{ marginVertical: 16 }}>
        Nuovo Task
      </Button>
      {tasks.length === 0 ? (
        <Text>Nessun task. Aggiungi uno nuovo!</Text>
      ) : (
        <FlatList
          data={sortedTasks}
          keyExtractor={(item) => item.id}
          renderItem={({ item }) => <TaskItem task={item} />}
          scrollEnabled={false}
        />
      )}
    </View>
  );
}
