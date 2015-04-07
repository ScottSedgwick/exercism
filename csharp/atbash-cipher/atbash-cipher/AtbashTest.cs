using NUnit.Framework;

[TestFixture]
public class AtbashTest
{
    // change Ignore to false to run test case or just remove 'Ignore = true'
    [TestCase("no", Result = "ml", Ignore = false)]
    [TestCase("yes", Result = "bvh", Ignore = false)]
    [TestCase("OMG", Result = "lnt", Ignore = false)]
    [TestCase("mindblowingly", Result = "nrmwy oldrm tob", Ignore = false)]
    [TestCase("Testing, 1 2 3, testing.", Result = "gvhgr mt123 gvhgr mt", Ignore = false)]
    [TestCase("Truth is fiction.", Result = "gifgs rhurx grlm", Ignore = false)]
    [TestCase("The quick brown fox jumps over the lazy dog.", Result = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", Ignore = false)]
    public string Encodes_words_using_atbash_cipher(string words)
    {
        return Atbash.Encode(words);
    }
}