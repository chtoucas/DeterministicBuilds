using System;

namespace ClassLibrary1
{
    public class Hello
    {
        public Hello(string who)
        {
            if (String.IsNullOrEmpty(who)) {
                throw new ArgumentNullException();
            }
            Who = who;
        }

        public string Who { get; }
    }
}
