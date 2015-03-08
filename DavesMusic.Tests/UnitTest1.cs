using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace DavesMusic.Tests {
    [TestClass]
    public class UnitTest1 {
        [TestMethod]
        public void Sample_PassingTest() {
            Assert.AreEqual(1,1);
        }

        [TestMethod]
        public void Sample_PassingTest2() {
            Assert.AreNotEqual(1, 2);
        }
    }
}
