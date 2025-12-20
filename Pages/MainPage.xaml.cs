using pr15.Service;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
using pr15.Models;
using System.ComponentModel;
using Microsoft.IdentityModel.Tokens;
using System.Globalization;

namespace pr15.Pages
{
    /// <summary>
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        public Pr15Context db = DBService.Instance.Context;
        public ProductService service = new ProductService();
        public CategoryService categoryService { get; set; } = new CategoryService();
        public BrandService brandService { get; set; } = new BrandService();
        public ICollectionView formsView { get; set; }
        public ObservableCollection<Product> forms { get; set; } = new();
        public string searchQuery { get; set; } = null!;
        public string filterHeightFrom { get; set; } = null!;
        public string filterHeightTo { get; set; } = null!;

        public Category filterCategory { get; set; } = null!;

        public Brand filterBrand { get; set; } = null!;
        public Product Product1 { get; set; } =null;
       
        public MainPage(bool role)
        {
            InitializeComponent();
            LoadList();
            formsView = CollectionViewSource.GetDefaultView(forms);
            formsView.Filter = FilterForms;
            if (!role)
            {
                b1.Visibility = Visibility.Collapsed;
                b2.Visibility = Visibility.Collapsed;
                b3.Visibility = Visibility.Collapsed;
                b4.Visibility = Visibility.Collapsed;
                b5.Visibility = Visibility.Collapsed;
                b6.Visibility = Visibility.Collapsed;
               
            }
            else
                FormsList.MouseDoubleClick += FormsList_MouseDoubleClick;

            Loaded += LoadList;

        }
        
        public void LoadList(object sender, EventArgs e)
        {
            forms.Clear();
            foreach (var form in db.Products.ToList())
                forms.Add(form);
        }
        public void LoadList()
        {
            forms.Clear();
            foreach (var form in db.Products.ToList())
                forms.Add(form);
        }
        private void OnPageLoaded(object sender, RoutedEventArgs e)
        {
            Loaded += LoadList;
        }
        public bool FilterForms(object obj)
        {
            if (obj is not Product)
                return false;
            var form = (Product)obj;
            if (searchQuery != null && !form.Name.Contains(searchQuery,
StringComparison.CurrentCultureIgnoreCase))
                return false;
            if (!filterHeightFrom.IsNullOrEmpty() && Convert.ToInt32(filterHeightFrom)
            > form.Price)
                return false;
            if (!filterHeightTo.IsNullOrEmpty() && Convert.ToInt32(filterHeightTo) <
            form.Price)
                return false;
            if(filterCategory != null && (form.Category == null || form.Category.Name != filterCategory.Name))
                return false;          
            if(filterBrand != null && (form.Brand == null||form.Brand.Name != filterBrand.Name))
                return false;
            return true;
        }
        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            formsView.Refresh();
        }

        private void ComboBox_SelectionChanged(object sender,
SelectionChangedEventArgs e)
        {
            
            formsView.SortDescriptions.Clear();
            var cb = (ComboBox)sender;
            var selected = (ComboBoxItem)cb.SelectedItem;
            if (selected == null) return;
            switch (selected.Tag)
            {
                case "Name":
                    formsView.SortDescriptions.Add(new SortDescription("Name",
                    ListSortDirection.Ascending));
                    break;
                case "Price":
                    formsView.SortDescriptions.Add(new SortDescription("Price",
                    ListSortDirection.Ascending));
                    break;
                case "Stock":
                    formsView.SortDescriptions.Add(new SortDescription("Stock",
                    ListSortDirection.Ascending));
                    break;
            }
            formsView.Refresh();
        }
        public void remove(object sender, EventArgs e)
        {
            if (Product1 == null)
            {
                MessageBox.Show("Выберите запись!");
                return;
            }
            if (MessageBox.Show("Вы действительно хотите удалить запись?", "Удалить?",
            MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                service.Remove(Product1);
                LoadList();
            }
        }
        private void ComboBox_SelectionChanged1(object sender,
SelectionChangedEventArgs e)
        {
            formsView.Refresh();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            //searchQuery = null;
            //formsView.Refresh();
            c1.SelectedItem=null;
            c2.SelectedItem=null;
            c3.SelectedItem=null;
            t1.Text = "";
            t2.Text = "";
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new ProductPage(brandService,categoryService));
        }

        private void FormsList_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            if (Product1 == null)
            {
                return;
            }

            NavigationService.Navigate(new ProductPage(brandService, categoryService,Product1));
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new BrandPage());
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new CategoryPage());
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new TagPage());
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            if (Product1 == null)
            {
                MessageBox.Show("Выберите запись!");
                return;
            }
            NavigationService.Navigate(new AddTagToProductPage(Product1));

        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
    public class LowStockConverter : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter, CultureInfo culture)
        {
            if (value is int stock)
            {
                return stock < 10; 
            }
            return false;
        }

        public object ConvertBack(object value, Type targetType, object parameter, CultureInfo culture)
        {
            throw new NotImplementedException();
        }
    }
}
