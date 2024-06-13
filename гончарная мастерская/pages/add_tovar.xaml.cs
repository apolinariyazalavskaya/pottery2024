using System;
using System.Collections.Generic;
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
using System.IO;
using Microsoft.Win32;
namespace гончарная_мастерская.pages
{
    /// <summary>
    /// Логика взаимодействия для add_tovar.xaml
    /// </summary>
    public partial class add_tovar : Page
    {
        private product_table _currenttools = new product_table();
        private string _filePath = null;
        private string _photoName = null;
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";

        public add_tovar(product_table selectedtovar)
        {
            InitializeComponent();
            if (selectedtovar != null)
            {
                _currenttools = selectedtovar;
                id.Visibility = Visibility.Hidden;
                tbid.Visibility = Visibility.Hidden;
                int x = selectedtovar.id_product;
            }
            DataContext = _currenttools;
            _photoName = _currenttools.photo;
            
            workers.ItemsSource = potteryEntities.GetContext().workers_table.ToList();
            category.ItemsSource = potteryEntities.GetContext().kategory_product_table.ToList();
            color.ItemsSource = potteryEntities.GetContext().color_table.ToList();
            material.ItemsSource = potteryEntities.GetContext().material_table.ToList();
        }
        private StringBuilder CheckFileds()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currenttools.name_product))
                s.AppendLine("Поле название пустое");

            if (_currenttools.articul < 0)
                s.AppendLine("Поле артикул пустое");

            
            if (_currenttools.price < 0)
                s.AppendLine("Цена не может быть отрицательна");
            
                
            if (_currenttools.kategory_product_table == null)
                s.AppendLine("Поле категория товара пустое");
            
            if (_currenttools.color_table == null)
                s.AppendLine("Поле цвет пустое");
            if (_currenttools.workers_table == null)
                s.AppendLine("Поле мастер пустое");
            if (_currenttools.material_table== null)
                s.AppendLine("Поле материал пустое");
            return s;


        }
        private void btnsave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFileds();
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            if (_currenttools.id_product == 0)
            {
                string photo = ChangePhotoName();
                string dest = _currentDirectory + photo;
                _currenttools.photo = photo;
                potteryEntities.GetContext().product_table.Add(_currenttools);
            }
            try
            {
                if (_filePath != null)
                {
                    string photo = ChangePhotoName();
                    string dest = _currentDirectory + photo;
                    File.Copy(_filePath, dest);
                    _currenttools.photo = photo;
                }
                potteryEntities.GetContext().SaveChanges();
                MessageBox.Show("Запись изменена");
                NavigationService.Navigate(new pages.catalog());
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;
        }
        private void btnLoad_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Selected a picture";
                op.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG(*.png)|*.png|JPG Files(*.jpg)|*jpg|GIG Files (*.gif)|*.gif";
                if (op.ShowDialog() == true)
                {
                    FileInfo fileInfo = new FileInfo(op.FileName);
                    if (fileInfo.Length > (1024 * 1024 * 2))
                    {
                        throw new Exception("Размер файла должен быть не более 2 Мб");

                    }
                    ImPhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;

                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }
        }

       
    }
}