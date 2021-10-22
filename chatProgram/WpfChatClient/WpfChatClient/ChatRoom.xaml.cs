﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfChatClient
{
    /// <summary>
    /// ChatRoom.xaml에 대한 상호 작용 논리
    /// </summary>
    public partial class ChatRoom : Page
    {
        NetworkStream stream = MainWindow.client.GetStream();

        public ChatRoom()
        {
            InitializeComponent();

            friend_list.ItemsSource = ChatMessage.Current.Chat;
        }

        private void Invite_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Source = new Uri("/FriendList.xaml", UriKind.Relative);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            DataPacket dp = new DataPacket
            {
                work = "chat_out",
                room_num = MainWindow.chat_room,
                user_id = MainWindow.userId
            };
            string json = JsonConvert.SerializeObject(dp, Formatting.Indented);
            byte[] buffer = Encoding.Unicode.GetBytes(json + "$");
            stream.Write(buffer, 0, buffer.Length);
            stream.Flush();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            DataPacket dp = new DataPacket
            {
                work = "chat_room_out",
                room_num = MainWindow.chat_room,
                user_id = MainWindow.userId
            };
            string json = JsonConvert.SerializeObject(dp, Formatting.Indented);
            byte[] buffer = Encoding.Unicode.GetBytes(json + "$");
            stream.Write(buffer, 0, buffer.Length);
            stream.Flush();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            DataPacket dp = new DataPacket
            {
                work = "send_message",
                room_num = MainWindow.chat_room,
                user_id = MainWindow.userId,
                message = this.message.Text
            };
            string json = JsonConvert.SerializeObject(dp, Formatting.Indented);
            byte[] buffer = Encoding.Unicode.GetBytes(json + "$");
            stream.Write(buffer, 0, buffer.Length);
            stream.Flush();
        }
    }
}
