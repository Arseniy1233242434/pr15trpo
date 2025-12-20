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
    /// Логика взаимодействия для EditBrandPage.xaml
    /// </summary>
    public partial class EditBrandPage : Page
    {
        public static Brand _group = new();
        public static Brand _group1 = new();
        public BrandService service { get; set; } = new();
        bool IsEdit = false;
        public EditBrandPage(Brand? group = null)
        {
            InitializeComponent();
            if (group != null)
            {
                _group1 = group;

                _group.Products = group.Products;
                _group.Name = group.Name;

                IsEdit = true;
                DataContext = _group;

                return;
            }

            _group = new Brand();
            DataContext = _group;
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (Validation.GetHasError(t1)||t1.Text=="")
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
    public class IsTitleCorrect : ValidationRule
    {

        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();

            BrandService service = new BrandService();  

            for (int i = 0; i < BrandService.Users.Count; i++)
            {
                if (BrandService.Users[i].Name== input && EditBrandPage._group.Name != input)
                {
                    return new ValidationResult(false, "Такой брэнд уже есть!");
                }
            }


            return ValidationResult.ValidResult;
        }
    }
}
