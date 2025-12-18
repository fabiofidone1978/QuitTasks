import React from 'react';
import { View } from 'react-native';
import { Button, Text } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';

export default function HomeScreen() {
  const navigation = useNavigation<any>();
  return (
    <View style={{ padding: 24 }}>
      <Text variant="headlineMedium">QuietTasks</Text>
      <Button mode="contained" onPress={() => navigation.navigate('AddTask')}>
        Nuovo Task
      </Button>
    </View>
  );
}
