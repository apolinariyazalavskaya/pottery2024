using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
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
using гончарная_мастерская.models;
using Microsoft.Win32;

namespace гончарная_мастерская.pages
{
    /// <summary>
    /// Логика взаимодействия для avtorizaz.xaml
    /// </summary>
   
    public partial class avtorizaz : Page
    {
        public avtorizaz()
        {
            InitializeComponent();

            if (GetRegistryKey("Password")?.Length > 0)
            {
                passwordtxt.Password = GetRegistryKey("Password");
                logintxt.Text = GetRegistryKey("Login");
            }

        }
        private static readonly string registryPath = System.IO.Path.Combine(Registry.CurrentUser.Name, "Software", "MyLoginSave");
        private static string GetRegistryKey(string key)
        {
            return (string)Registry.GetValue(registryPath, key, string.Empty);
        }
        private static void  SetRegistryKey(string key, string value)
        {
            Registry.SetValue(registryPath, key, value, RegistryValueKind.String);
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            workers_table workers = potteryEntities.GetContext().workers_table.FirstOrDefault(p => p.login == logintxt.Text && p.password == passwordtxt.Password);
            if (workers == null)
            {
                MessageBox.Show("неверный логин или пароль, пожалуйста попробуйте еще раз");
                return;
            }
            if (chkbox.IsChecked == true)
            {
                SetRegistryKey("Password", passwordtxt.Password);
                SetRegistryKey("Login", logintxt.Text);
            }
           

            if (string.IsNullOrEmpty(logintxt.Text) || string.IsNullOrEmpty(passwordtxt.Password))
            {
                MessageBox.Show("Введите логин и пароль");
                return;
            }
            using (var db = new potteryEntities())
            {
                var user = db.workers_table
                    .AsNoTracking()
                    .FirstOrDefault(u => u.login == logintxt.Text && u.password == passwordtxt.Password);
                if (user == null)
                {
                    MessageBox.Show("Пользователь с такими данными не найден");
                    return;

                }
                switch (user.dolznost_id)
                {
                    case 1:
                        NavigationService.Navigate(new pages.admin());
                        break;
                    case 2:
                        NavigationService.Navigate(new pages.catalog());
                        break;
                }
            }
        }
    }
}
