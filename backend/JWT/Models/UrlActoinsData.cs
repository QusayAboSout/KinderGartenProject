using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JWT.Models.AppAction
{
    public class UrlActoinsData
    {
        public Dictionary<string, List<string>> AuthUrlsDictionary;
        public Dictionary<string, string> PublicUrlsDictionary;

        public UrlActoinsData(Dictionary<string, List<string>> urlsDictionary, Dictionary<string, string> publicUrlsDictionary)
        {
            AuthUrlsDictionary = urlsDictionary;
            PublicUrlsDictionary = publicUrlsDictionary;    
        }
    }
    
}
