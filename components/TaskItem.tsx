import React from 'react';
import { View } from 'react-native';
import { Text, Checkbox, IconButton } from 'react-native-paper';
import { useTaskStore } from '../store/taskStore';
import { Task } from '../types/tasks';

interface TaskItemProps {
  task: Task;
}

export default function TaskItem({ task }: TaskItemProps) {
  const toggleTask = useTaskStore((state) => state.toggleTask);
  const removeTask = useTaskStore((state) => state.removeTask);

  return (
    <View
      style={{
        flexDirection: 'row',
        alignItems: 'center',
        paddingVertical: 8,
        borderBottomWidth: 1,
        borderBottomColor: '#e0e0e0',
      }}
    >
      <Checkbox
        status={task.completed ? 'checked' : 'unchecked'}
        onPress={() => toggleTask(task.id)}
      />
      <View style={{ flex: 1, marginLeft: 8 }}>
        <Text
          style={{
            textDecorationLine: task.completed ? 'line-through' : 'none',
            color: task.completed ? '#999' : '#000',
          }}
        >
          {task.title}
        </Text>
        <View style={{ flexDirection: 'row', marginTop: 4 }}>
          <Text variant="labelSmall" style={{ marginRight: 8 }}>
            {task.bucket === 'today' ? '📅 Oggi' : '📋 Dopo'}
          </Text>
          <Text variant="labelSmall">@{task.context}</Text>
        </View>
      </View>
      <IconButton
        icon="delete"
        size={20}
        onPress={() => removeTask(task.id)}
      />
    </View>
  );
}
