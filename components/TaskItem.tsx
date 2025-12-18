import React from 'react';
import { Text } from 'react-native-paper';

export default function TaskItem({ title }: { title: string }) {
  return <Text>{title}</Text>;
}
