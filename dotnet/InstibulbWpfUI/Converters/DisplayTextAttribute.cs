﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace InstiBulb.Converters
{
    [AttributeUsage(AttributeTargets.Field)]
    public class DisplayTextAttribute : Attribute
    {
        private readonly string value;
        public string Value
        {
            get { return value; }
        }

        public string ResourceKey { get; set; }

        public DisplayTextAttribute(string v)
        {
            this.value = v;
        }

        public DisplayTextAttribute()
        {
        }
    }
}
