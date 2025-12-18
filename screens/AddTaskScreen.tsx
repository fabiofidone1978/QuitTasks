import React from 'react';
import { View } from 'react-native';
import { Button, TextInput } from 'react-native-paper';
import { useNavigation } from '@react-navigation/native';

export default function AddTaskScreen() {
  const navigation = useNavigation<any>();
  return (
    <View style={{ padding: 24 }}>
      <TextInput label="Task" />
      <Button onPress={() => navigation.goBack()}>Salva</Button>
    </View>
  );
}
