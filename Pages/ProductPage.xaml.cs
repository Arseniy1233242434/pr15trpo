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
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public static Product _student { get; set; } = new();
        public static Product _student1 { get; set; } = null;

        public CategoryService categoryService { get; set; } = null;
        public BrandService brandService { get; set; } = null;
        public ProductService service = new ProductService();
        bool isEdit = false;
        
        public ProductPage(BrandService a1, CategoryService a2,Product? _edituser = null)
        {
            categoryService = a2;
            brandService = a1;  
            InitializeComponent();
            if (_edituser != null)
            {
                _student1 = _edituser;
                _student.Id = _edituser.Id;
                _student.Name = _edituser.Name;
                _student.Rating = _edituser.Rating;
                _student.Description = _edituser.Description;    
                _student.Category = _edituser.Category;
                _student.Brand = _edituser.Brand;
                _student.Name = _edituser. Name;
                _student.Stock = _edituser.Stock;   
                _student.BrandId = _edituser.BrandId;
                _student.CategoryId = _edituser.CategoryId;
                _student.CreatedAt = _edituser.CreatedAt;
                _student.Price = _edituser.Price;
                _student.Tags = _edituser.Tags;

              //  _student = _edituser;
                isEdit = true;
               
               
            }
            else
            _student = new();
          
            DataContext = this;
        }
        private void save(object sender, RoutedEventArgs e)
        {
            if (Validation.GetHasError(email)|| Validation.GetHasError(password1)|| Validation.GetHasError(password)||c1.SelectedItem==null||c2.SelectedItem==null||t2.Text==""||login.Text==""||email.Text==""||password.Text==""||password1.Text=="")
            {
                MessageBox.Show("Корректно заполните все поля!");
                return;
            }
            if (isEdit)
            {
               
               
                _student1.Name = _student.Name;
                _student1.Rating = _student.Rating;
                _student1.Description = _student.Description;
                _student1.Category = _student.Category;
                _student1.Brand = _student.Brand;
                _student1.Name = _student.Name;
                _student1.Stock = _student.Stock;
                _student1.BrandId = _student.BrandId;
                _student1.CategoryId = _student.CategoryId;
                _student1.CreatedAt = _student.CreatedAt;
                _student1.Price = _student.Price;
                _student1.Tags = _student.Tags;
                service.Commit();
                
            }
            else
                service.Add(_student);
            NavigationService.GoBack();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
    public class Converter3 : IValueConverter
    {
        public object Convert(object value, Type targetType, object parameter,
        CultureInfo culture)
        {
            if(value == null)
                return DateTime.Now;
            if(value is DateOnly)
            {
                DateOnly a = (DateOnly)value;
                DateTime b = a.ToDateTime(new TimeOnly(0, 0, 0));
                return b;
            }
            
            return value;
        }
        public object ConvertBack(object value, Type targetType, object parameter,
        CultureInfo culture)
        {
            return value;
        }
    }
    public class IsPriceCorrect : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            string h=(string)value;
           
            if(!decimal.TryParse(h, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal a))
            {
                string modified = h.Replace(',', '.');
                if (!decimal.TryParse(h, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal a1))
                    return new ValidationResult(false, "Неправильный формат цены!");
            }
            if (a<=0)
            {
                return new ValidationResult(false, "Неправильный формат цены!");
            }
                return ValidationResult.ValidResult;
        }
    }
    public class IsStockCorrect : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            string h = (string)value;

            if (!int.TryParse(h, NumberStyles.Any, CultureInfo.InvariantCulture, out int a))
            {
                
                    return new ValidationResult(false, "Неправильный формат остатка!");
            }
            if (a <= 0)
            {
                return new ValidationResult(false, "Неправильный формат остатка!");
            }
            return ValidationResult.ValidResult;
        }
    }
    public class IsRatingCorrect : ValidationRule
    {
        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            string h = (string)value;

            

            if (!decimal.TryParse(h, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal a))
            {
                string modified = h.Replace(',', '.');
                if (!decimal.TryParse(h, NumberStyles.Any, CultureInfo.InvariantCulture, out decimal a1))
                    return new ValidationResult(false, "Неправильный формат рейтинга!");
            }
            if (a <= 0||a>5)
            {
                return new ValidationResult(false, "Рейтиг должен быть от 1 до 5 не больше одного знака после .!");
            }
            return ValidationResult.ValidResult;
        }
    }
}
