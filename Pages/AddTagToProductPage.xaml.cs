using pr15.Models;
using pr15.Service;
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

namespace pr15.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddTagToProductPage.xaml
    /// </summary>
    public partial class AddTagToProductPage : Page
    {
        public Product group { get; set; } = null;
        public Tag current { get; set; } = null;
        public TagService service { get; set; } = new TagService();
        public Tag current1 { get; set; } = null;
        public ProductService service1 = new ProductService();
        public AddTagToProductPage(Product a)
        {
            group = a;
            InitializeComponent();
            
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (current == null)
            {
                MessageBox.Show("Выберите запись!");
                return;
            }
            if (MessageBox.Show("Вы действительно хотите удалить запись?", "Удалить?",
            MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                group.Tags.Remove(current);
                service1.Commit();
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (c1.SelectedItem==null)
            {
                MessageBox.Show("Выберите тэг!");
                return;
            }
            if (group.Tags.Contains(current1)) 
            {
                MessageBox.Show("Такой тэг уже есть!");
                return;
            } 
                
                
            
            group.Tags.Add(current1);
            service1.Commit();
            
        }
    }
}
