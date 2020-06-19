using Xunit;
using ClassLibrary1;

namespace XUnitTestProject1
{
    public class UnitTest1
    {
        [Fact]
        public void Test1()
        {
            Assert.Equal("John Doe", new Hello("John Doe").Who);
        }
    }
}
