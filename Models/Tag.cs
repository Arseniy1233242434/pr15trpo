using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace pr15.Models;

public partial class Tag
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ObservableCollection<Product> Products { get; set; } = new ObservableCollection<Product>();
}
