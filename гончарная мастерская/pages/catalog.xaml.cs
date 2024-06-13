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

namespace гончарная_мастерская.pages
{
    /// <summary>
    /// Логика взаимодействия для catalog.xaml
    /// </summary>
    public partial class catalog : Page
    {
        int _itemcount = 0;
        int _allitemcount = 0;
        int _pagenumber = 0;
        int _pagecount = 0;
        List<product_table> products;
        
        public catalog()
        {
            InitializeComponent();
            var product_category = potteryEntities.GetContext().kategory_product_table.OrderBy(x => x.name_kategory).ToList();
            product_category.Insert(0, new kategory_product_table
            {
                name_kategory = "все категории"
            });
            category.ItemsSource = product_category;
            category.SelectedIndex = 0;


            var product_color = potteryEntities.GetContext().color_table.OrderBy(x => x.color_name).ToList();
            product_color.Insert(0, new color_table
            {
                color_name = "все цвета"
            });
            color.ItemsSource = product_color;
            color.SelectedIndex = 0;
            _allitemcount = cataloglistbox.Items.Count;
            textblockcount.Text = $" Результат запроса: {_allitemcount} записей из { _allitemcount  } ";
        }

        private void color_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
             UpdateData();
        }
        private void InitializeListBoxPages()
        {
            listboxcountpages.Items.Clear();
            _pagecount = _itemcount / 10;
            if (_itemcount % 10 != 0)
                _pagecount++;
            for (int i = 1; i <= _pagecount; i++)
            {
                ListBoxItem itm = new ListBoxItem
                {
                    Content = i.ToString()
                };
                listboxcountpages.Items.Add(itm);
            }
        }

        void LoadData()
        {
            potteryEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            products = potteryEntities.GetContext().product_table.OrderBy(p => p.name_product).ToList();
            _allitemcount = products.Count;
            _itemcount = _allitemcount;
            cataloglistbox.ItemsSource = potteryEntities.GetContext().product_table.OrderBy(p => p.name_product).ToList();
            _pagenumber = 1;
            InitializeListBoxPages();
            int k = products.Count - (_pagenumber - 1) * 10;
            if (k < 10)
                cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, k);
            else cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, 10);
            textblockcount.Text = $"Результат запроса: {_itemcount} записей из {_allitemcount}";
        }
                
        private void UpdateData()
        {
            var currentproducts = potteryEntities.GetContext().product_table.OrderBy(p => p.name_product).ToList();
            if (category.SelectedIndex > 0)
                currentproducts = currentproducts.Where(p => p.category_product == (category.SelectedItem as kategory_product_table).id_kategory).ToList();
            currentproducts = currentproducts.Where(p => p.name_product.ToLower().Contains(search.Text.ToLower())).ToList();
           
            if (color.SelectedIndex > 0)
                 currentproducts = currentproducts.Where(p => p.color_id == (color.SelectedItem as color_table).id_color).ToList();
            currentproducts = currentproducts.Where(p => p.name_product.ToLower().Contains(search.Text.ToLower())).ToList();



            if (sort.SelectedIndex >= 0)
            {
                if (sort.SelectedIndex == 0)
                    currentproducts = currentproducts.OrderBy(p => p.price).ToList();
                if (sort.SelectedIndex == 1)
                    currentproducts = currentproducts.OrderByDescending(p => p.price).ToList();
                if (sort.SelectedIndex == 2)
                    currentproducts = currentproducts.OrderBy(p => p.name_product).ToList();
                if (sort.SelectedIndex == 3)
                    currentproducts = currentproducts.OrderByDescending(p => p.name_product).ToList();
            }
            _pagenumber = 1;
            products = currentproducts;
            cataloglistbox.ItemsSource = currentproducts;
            _itemcount = currentproducts.Count;
            InitializeListBoxPages();
            int k = products.Count - (_pagenumber - 1) * 10;
            if (k < 10)
                cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, k);
            else
                cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, 10);

            textblockcount.Text = $" Результат запроса: {currentproducts.Count} записей из { _allitemcount  } ";
        }

        private void search_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void category_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void sort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void cataloglistbox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void BtnPrev_Click(object sender, RoutedEventArgs e)
        {
            if ((_pagenumber > 1))
                _pagenumber--;
            cataloglistbox.SelectedIndex = _pagenumber - 1;
        }

        private void listboxcountpages_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (cataloglistbox.SelectedItems.Count == 0)
                return;
            ListBoxItem lbi = ((sender as ListBox).SelectedItem as ListBoxItem);

            _pagenumber = Convert.ToInt32(lbi.Content);
            int k = products.Count - (_pagenumber - 1) * 10;
            if (k < 10)
                cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, k);
            else
                cataloglistbox.ItemsSource = products.GetRange((_pagenumber - 1) * 10, 10);
        }

        private void BtnNext_Click(object sender, RoutedEventArgs e)
        {
            if ((_pagenumber < _pagecount))
                _pagenumber++;
            cataloglistbox.SelectedIndex = _pagenumber - 1;
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                LoadData();
            }
        }

        private void delete_Click(object sender, RoutedEventArgs e)
        {
            var selectedAvtos = cataloglistbox.SelectedItems.Cast<product_table>().ToList();
            MessageBoxResult messageBoxResult = MessageBox.Show($"Удалить {selectedAvtos.Count} записей?", "удаление", MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (messageBoxResult == MessageBoxResult.OK)
            {
                try
                {
                    product_table x = selectedAvtos[0];
                    potteryEntities.GetContext().product_table.Remove(x);
                    potteryEntities.GetContext().SaveChanges();
                    MessageBox.Show("записи удалены");
                    List<product_table> goods = potteryEntities.GetContext().product_table.OrderBy(p => p.name_product).ToList();
                    cataloglistbox.ItemsSource = null;
                    cataloglistbox.ItemsSource = goods;
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString(), "ошибка удаления", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void add_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new pages.add_tovar(null));
        }

        private void edit_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new pages.add_tovar((sender as Button).DataContext as product_table));
        }
    }
}
