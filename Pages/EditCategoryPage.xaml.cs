using pr15.Models;
using pr15.Service;
using System;
using System.Collections.Generic;
using System.Globalization;
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
    /// Логика взаимодействия для EditCategoryPage.xaml
    /// </summary>
    public partial class EditCategoryPage : Page
    {
        public static Category _group = new();
        public static Category _group1 = new();
        public CategoryService service { get; set; } = new();
        bool IsEdit = false;
        public EditCategoryPage(Category? group = null)
        {
            InitializeComponent();
            if (group != null)
            {
                _group1 = group;

                _group.Products=group.Products;
                _group.Name=group.Name;
                IsEdit = true;
                DataContext = _group;

                return;
            }

            _group = new Category();
            DataContext = _group;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Validation.GetHasError(t1) || t1.Text == "")
            {
                MessageBox.Show("Корректно заполните все поля!");
                return;
            }
            if (IsEdit)
            {
                _group1.Name =_group.Name;
                service.Commit();
            }
            else
                service.Add(_group);
           


            Button_Click_1(sender, e);
        }
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
    public class IsTitleCorrect2 : ValidationRule
    {

        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();

            CategoryService service = new CategoryService();

            for (int i = 0; i < CategoryService.Users.Count; i++)
            {
                if (CategoryService.Users[i].Name == input && EditCategoryPage._group.Name != input)
                {
                    return new ValidationResult(false, "Такой брэнд уже есть!");
                }
            }


            return ValidationResult.ValidResult;
        }
    }

}
