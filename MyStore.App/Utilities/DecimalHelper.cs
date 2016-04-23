using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MyStore.App.Utilities
{
    public static class DecimalHelper
    {
        public static string ToString(decimal? number, string strFormat)
        {
            return number.HasValue ? number.Value.ToString(strFormat) : "0";
        }
    }
}