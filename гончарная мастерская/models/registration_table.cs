//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace гончарная_мастерская.models
{
    using System;
    using System.Collections.Generic;
    
    public partial class registration_table
    {
        public int id_registration { get; set; }
        public int klient { get; set; }
        public int course { get; set; }
    
        public virtual course_group_table course_group_table { get; set; }
        public virtual klient_table klient_table { get; set; }
    }
}
