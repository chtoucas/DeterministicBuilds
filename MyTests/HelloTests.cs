using Xunit;
using MyLibrary;

namespace MyTests
{
    public class HelloTests
    {
        [Fact]
        public void Who()
        {
            Assert.Equal("John Doe", new Hello("John Doe").Who);
        }
    }
}
