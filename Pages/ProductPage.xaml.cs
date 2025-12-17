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
        public CategoryService categoryService { get; set; } = new CategoryService();
        public BrandService brandService { get; set; } = new BrandService();
        bool isEdit = false;
        public ProductService service = new ProductService();
        public ProductPage(Product? _edituser = null)
        {
            InitializeComponent();
            if (_edituser != null)
            {
                _student = _edituser;
                isEdit = true;
               
               
            }
            else
            _student = new();
          
            DataContext = this;
        }
        private void save(object sender, RoutedEventArgs e)
        {
            if (isEdit)
                service.Commit();
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
