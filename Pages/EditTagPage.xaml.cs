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
    /// Логика взаимодействия для EditTagPage.xaml
    /// </summary>
    public partial class EditTagPage : Page
    {
        public static Tag _group = new();
        public static Tag _group1 = new();
        public TagService service { get; set; } = new();
        bool IsEdit = false;
        public EditTagPage(Tag? group = null)
        {
            InitializeComponent();
            if (group != null)
            {
                _group1 = group;

                _group.Name = group.Name;
                IsEdit = true;
                DataContext = _group;

                return;
            }

            _group = new Tag();
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
    public class IsTitleCorrect3 : ValidationRule
    {

        public override ValidationResult Validate(object value, CultureInfo
        cultureInfo)
        {
            var input = (value ?? "").ToString().Trim();

            TagService service = new TagService();

            for (int i = 0; i < TagService.Users.Count; i++)
            {
                if (TagService.Users[i].Name == input && EditTagPage._group.Name != input)
                {
                    return new ValidationResult(false, "Такой тэг уже есть!");
                }
            }


            return ValidationResult.ValidResult;
        }
    }
}
