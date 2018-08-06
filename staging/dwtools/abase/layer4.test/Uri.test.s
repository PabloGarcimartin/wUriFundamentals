( function _Uri_test_s_( ) {

'use strict';

if( typeof module !== 'undefined' )
{

  if( typeof _global_ === 'undefined' || !_global_.wBase )
  {
    let toolsPath = '../../../dwtools/Base.s';
    let toolsExternal = 0;
    try
    {
      toolsPath = require.resolve( toolsPath );
    }
    catch( err )
    {
      toolsExternal = 1;
      require( 'wTools' );
    }
    if( !toolsExternal )
    require( toolsPath );
  }

  var _ = _global_.wTools;

  _.include( 'wTesting' );

  require( '../layer3/PathFundamentals.s' );

}

var _global = _global_; var _ = _global_.wTools;

//

function uriNormalize( test )
{
  var got;

  test.case = 'dot at end'; /* */

  var path = 'ext:///.';
  var expected = 'ext:///';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'file:///C/proto/.';
  var expected = 'file:///C/proto';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '://some/staging/index.html/'
  var expected ='://some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = '://some/staging/index.html/.'
  var expected ='://some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = '://some/staging/index.html.'
  var expected ='://some/staging/index.html.'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html'
  var expected =':///some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html/.'
  var expected =':///some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html/./'
  var expected =':///some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/./index.html/./'
  var expected =':///some/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/.//index.html/./'
  var expected =':///some/staging//index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html///.'
  var expected =':///some/staging/index.html///'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'file:///some/staging/index.html/..'
  var expected ='file:///some/staging'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'file:///some/staging/index.html/..///'
  var expected ='file:///some/staging///'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'file:///some\\staging\\index.html\\..\\'
  var expected ='file:///some/staging'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/staging/index.html/.'
  var expected ='http:///some.come/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/staging/index.html'
  var expected ='http:///some.come/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/./staging/index.html'
  var expected ='http:///some.come/staging/index.html'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'svn+https://../user@subversion.com/svn/trunk'
  var expected ='svn+https://../user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'svn+https://..//..//user@subversion.com/svn/trunk'
  var expected ='svn+https://..//user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'svn+https://..//../user@subversion.com/svn/trunk'
  var expected ='svn+https://../user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/.?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/./../?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path?query=here&and=here#anchor'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/.//../?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/index/ranking/.'
  var expected ='https://web.archive.org/web/*\/http://www.heritage.org/index/ranking'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http://www.heritage.org/index/ranking//'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org//index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http://www.heritage.org//index/ranking//'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/../index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http://index/ranking//'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/.././index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http://index/ranking//'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/.././index/ranking/./.'
  var expected ='https://web.archive.org/web/*\/http://index/ranking'
  var got = _.uri.uriNormalize( path );
  test.identical( got,expected )

}

//

function uriNormalizeLocalPaths( test )
{
  var got;

  test.case = 'posix path'; /* */

  var path = '/foo/bar//baz/asdf/quux/..';
  var expected = '/foo/bar//baz/asdf';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/bar//baz/asdf/quux/../';
  var expected = '/foo/bar//baz/asdf';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '//foo/bar//baz/asdf/quux/..//';
  var expected = '//foo/bar//baz/asdf//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar//baz/asdf/quux/..//.';
  var expected = 'foo/bar//baz/asdf//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'winoows path'; /* */

  var path = 'C:\\temp\\\\foo\\bar\\..\\';
  var expected = '/C/temp//foo';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\\\';
  var expected = '/C/temp//foo//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\\\';
  var expected = '/C/temp//foo//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\..\\';
  var expected = '/C/temp//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\..\\.';
  var expected = '/C/temp//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'empty path'; /* */

  var path = '';
  var expected = '.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/';
  var expected = '/';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '//';
  var expected = '//';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '///';
  var expected = '///';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/.';
  var expected = '/';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/./.';
  var expected = '/';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '.';
  var expected = '.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = './.';
  var expected = '.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with "." in the middle'; /* */

  var path = 'foo/./bar/baz';
  var expected = 'foo/bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/././bar/baz/';
  var expected = 'foo/bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/././bar/././baz/';
  var expected = 'foo/bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/././bar/././baz/';
  var expected = '/foo/bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/.x./baz/';
  var expected = '/foo/.x./baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with "." in the beginning'; /* */

  var path = './foo/bar';
  var expected = './foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '././foo/bar/';
  var expected = './foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  debugger
  var path = './/.//foo/bar/';
  var expected = './//foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/.//.//foo/bar/';
  var expected = '///foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '.x/foo/bar';
  var expected = '.x/foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '.x./foo/bar';
  var expected = '.x./foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = './x/.';
  var expected = './x';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with "." in the end'; /* */

  var path = 'foo/bar.';
  var expected = 'foo/bar.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/.bar.';
  var expected = 'foo/.bar.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/.';
  var expected = 'foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/./.';
  var expected = 'foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/././';
  var expected = 'foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/bar/././';
  var expected = '/foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/baz/.x./';
  var expected = '/foo/baz/.x.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the middle'; /* */

  var path = 'foo/../bar/baz';
  var expected = 'bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/../../bar/baz/';
  var expected = '../bar/baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/../../bar/../../baz/';
  var expected = '../../baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/../../bar/../../baz/';
  var expected = '/../../baz';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the beginning'; /* */

  var path = '../foo/bar';
  var expected = '../foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '../../foo/bar/';
  var expected = '../../foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '..//..//foo/bar/';
  var expected = '..//foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/..//..//foo/bar/';
  var expected = '/..//foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '..x/foo/bar';
  var expected = '..x/foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '..x../foo/bar';
  var expected = '..x../foo/bar';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the end'; /* */

  var path = 'foo/bar..';
  var expected = 'foo/bar..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/..bar..';
  var expected = 'foo/..bar..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/..';
  var expected = 'foo';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/../..';
  var expected = '.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../';
  var expected = '.';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/foo/bar/../../';
  var expected = '/';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../..';
  var expected = '..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../../..';
  var expected = '../..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = 'foo/../bar/../../../..';
  var expected = '../../..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  test.case = 'path with ".." and "." combined'; /* */

  var path = '/abc/./../a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/abc/.././a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/abc/./.././a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/a/b/abc/../.';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/a/b/abc/./..';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '/a/b/abc/./../.';
  var expected = '/a/b';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = './../.';
  var expected = '..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = './..';
  var expected = '..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

  var path = '../.';
  var expected = '..';
  var got = _.uri.uriNormalize( path );
  test.identical( got, expected );

}

//

function uriNormalizeTolerant( test )
{
  var got;

  test.case = 'dot at end'; /* */

  var path = 'ext:///.';
  var expected = 'ext:///';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'file:///C/proto/.';
  var expected = 'file:///C/proto/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '://some/staging/index.html/'
  var expected ='://some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = '://some/staging/index.html/.'
  var expected ='://some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = '://some/staging/index.html.'
  var expected ='://some/staging/index.html.'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html'
  var expected =':///some/staging/index.html'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html/.'
  var expected =':///some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html/./'
  var expected =':///some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/./index.html/./'
  var expected =':///some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/.//index.html/./'
  var expected =':///some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = ':///some/staging/index.html///.'
  var expected =':///some/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'file:///some/staging/index.html/..'
  var expected ='file:///some/staging/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'file:///some/staging/index.html/..///'
  var expected ='file:///some/staging/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'file:///some\\staging\\index.html\\..\\'
  var expected ='file:///some/staging/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/staging/index.html/.'
  var expected ='http:///some.come/staging/index.html/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/staging/index.html'
  var expected ='http:///some.come/staging/index.html'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'http:///./some.come/./staging/index.html'
  var expected ='http:///some.come/staging/index.html'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'svn+https://../user@subversion.com/svn/trunk'
  var expected ='svn+https://../user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'svn+https://..//..//user@subversion.com/svn/trunk'
  var expected ='svn+https://../user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'svn+https://..//../user@subversion.com/svn/trunk'
  var expected ='svn+https://../user@subversion.com/svn/trunk'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/.?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path/name/?query=here&and=here#anchor'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/./../?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path/?query=here&and=here#anchor'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'complex+protocol://www.site.com:13/path/name/.//../?query=here&and=here#anchor'
  var expected ='complex+protocol://www.site.com:13/path/name/?query=here&and=here#anchor'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/index/ranking/.'
  var expected ='https://web.archive.org/web/*\/http:/www.heritage.org/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http:/www.heritage.org/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org//index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http:/www.heritage.org/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/../index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http:/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/.././index/ranking//.'
  var expected ='https://web.archive.org/web/*\/http:/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

  var path = 'https://web.archive.org/web/*\/http://www.heritage.org/.././index/ranking/./.'
  var expected ='https://web.archive.org/web/*\/http:/index/ranking/'
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got,expected )

}

//

function uriNormalizeLocalPathsTolerant( test )
{
  var got;

  test.case = 'posix path'; /* */

  var path = '/foo/bar//baz/asdf/quux/..';
  var expected = '/foo/bar/baz/asdf/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/bar//baz/asdf/quux/../';
  var expected = '/foo/bar/baz/asdf/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '//foo/bar//baz/asdf/quux/..//';
  var expected = '/foo/bar/baz/asdf/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar//baz/asdf/quux/..//.';
  var expected = 'foo/bar/baz/asdf/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'winoows path'; /* */

  var path = 'C:\\temp\\\\foo\\bar\\..\\';
  var expected = '/C/temp/foo/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\\\';
  var expected = '/C/temp/foo/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\\\';
  var expected = '/C/temp/foo/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\..\\';
  var expected = '/C/temp/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'C:\\temp\\\\foo\\bar\\..\\..\\.';
  var expected = '/C/temp/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'empty path'; /* */

  var path = '';
  var expected = '.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '//';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '///';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/.';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/./.';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '.';
  var expected = '.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = './.';
  var expected = '.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with "." in the middle'; /* */

  var path = 'foo/./bar/baz';
  var expected = 'foo/bar/baz';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/././bar/baz/';
  var expected = 'foo/bar/baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/././bar/././baz/';
  var expected = 'foo/bar/baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/././bar/././baz/';
  var expected = '/foo/bar/baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/.x./baz/';
  var expected = '/foo/.x./baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with "." in the beginning'; /* */

  var path = './foo/bar';
  var expected = './foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '././foo/bar/';
  var expected = './foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = './/.//foo/bar/';
  var expected = './foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/.//.//foo/bar/';
  var expected = '/foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '.x/foo/bar';
  var expected = '.x/foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '.x./foo/bar';
  var expected = '.x./foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = './x/.';
  var expected = './x/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with "." in the end'; /* */

  var path = 'foo/bar.';
  var expected = 'foo/bar.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/.bar.';
  var expected = 'foo/.bar.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/.';
  var expected = 'foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/./.';
  var expected = 'foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/././';
  var expected = 'foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/bar/././';
  var expected = '/foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/baz/.x./';
  var expected = '/foo/baz/.x./';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the middle'; /* */

  var path = 'foo/../bar/baz';
  var expected = 'bar/baz';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/../../bar/baz/';
  var expected = '../bar/baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/../../bar/../../baz/';
  var expected = '../../baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/../../bar/../../baz/';
  var expected = '/../../baz/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the beginning'; /* */

  var path = '../foo/bar';
  var expected = '../foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '../../foo/bar/';
  var expected = '../../foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '..//..//foo/bar/';
  var expected = '../foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/..//..//foo/bar/';
  var expected = '/../foo/bar/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '..x/foo/bar';
  var expected = '..x/foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '..x../foo/bar';
  var expected = '..x../foo/bar';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with ".." in the end'; /* */

  var path = 'foo/bar..';
  var expected = 'foo/bar..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/..bar..';
  var expected = 'foo/..bar..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/..';
  var expected = 'foo/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/../..';
  var expected = '.';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/foo/bar/../../';
  var expected = '/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../..';
  var expected = '..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/bar/../../../..';
  var expected = '../..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = 'foo/../bar/../../../..';
  var expected = '../../..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  test.case = 'path with ".." and "." combined'; /* */

  var path = '/abc/./../a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/abc/.././a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/abc/./.././a/b';
  var expected = '/a/b';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/a/b/abc/../.';
  var expected = '/a/b/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/a/b/abc/./..';
  var expected = '/a/b/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '/a/b/abc/./../.';
  var expected = '/a/b/';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = './../.';
  var expected = '../';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = './..';
  var expected = '..';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );

  var path = '../.';
  var expected = '../';
  var got = _.uri.uriNormalizeTolerant( path );
  test.identical( got, expected );
}

//

function uriRefine( test )
{
  test.case = 'refine the uri';

  var cases =
  [
    { src : '', error : true },

    { src : 'a/', expected : 'a' },
    { src : 'a//', expected : 'a//' },
    { src : 'a\\', expected : 'a' },
    { src : 'a\\\\', expected : 'a//' },

    { src : 'a', expected : 'a' },
    { src : 'a/b', expected : 'a/b' },
    { src : 'a\\b', expected : 'a/b' },
    { src : '\\a\\b\\c', expected : '/a/b/c' },
    { src : '\\\\a\\\\b\\\\c', expected : '//a//b//c' },
    { src : '\\', expected : '/' },
    { src : '\\\\', expected : '//' },
    { src : '\\\\\\', expected : '///' },
    { src : '/', expected : '/' },
    { src : '//', expected : '//' },
    { src : '///', expected : '///' },

    {
      src : '/some/staging/index.html',
      expected : '/some/staging/index.html'
    },
    {
      src : '/some/staging/index.html/',
      expected : '/some/staging/index.html'
    },
    {
      src : '//some/staging/index.html',
      expected : '//some/staging/index.html'
    },
    {
      src : '//some/staging/index.html/',
      expected : '//some/staging/index.html'
    },
    {
      src : '///some/staging/index.html',
      expected : '///some/staging/index.html'
    },
    {
      src : '///some/staging/index.html/',
      expected : '///some/staging/index.html'
    },
    {
      src : 'file:///some/staging/index.html',
      expected : 'file:///some/staging/index.html'
    },
    {
      src : 'file:///some/staging/index.html/',
      expected : 'file:///some/staging/index.html'
    },
    {
      src : 'http://some.come/staging/index.html',
      expected : 'http://some.come/staging/index.html'
    },
    {
      src : 'http://some.come/staging/index.html/',
      expected : 'http://some.come/staging/index.html'
    },
    {
      src : 'svn+https://user@subversion.com/svn/trunk',
      expected : 'svn+https://user@subversion.com/svn/trunk'
    },
    {
      src : 'svn+https://user@subversion.com/svn/trunk/',
      expected : 'svn+https://user@subversion.com/svn/trunk'
    },
    {
      src : 'complex+protocol://www.site.com:13/path/name/?query=here&and=here#anchor',
      expected : 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor'
    },
    {
      src : 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor',
      expected : 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor'
    },
    {
      src : 'https://web.archive.org/web/*/http://www.heritage.org/index/ranking',
      expected : 'https://web.archive.org/web/*/http://www.heritage.org/index/ranking'
    },
    {
      src : 'https://web.archive.org//web//*//http://www.heritage.org//index//ranking',
      expected : 'https://web.archive.org//web//*//http://www.heritage.org//index//ranking'
    },
    {
      src : '://www.site.com:13/path//name//?query=here&and=here#anchor',
      expected : '://www.site.com:13/path//name//?query=here&and=here#anchor'
    },
    {
      src : ':///www.site.com:13/path//name/?query=here&and=here#anchor',
      expected : ':///www.site.com:13/path//name?query=here&and=here#anchor'
    },
  ]

  for( var i = 0; i < cases.length; i++ )
  {
    var c = cases[ i ];
    if( c.error )
    test.shouldThrowError( () => _.uri.uriRefine( c.src ) );
    else
    test.identical( _.uri.uriRefine( c.src ), c.expected );
  }

}

//

function urisRefine( test )
{
  test.case = 'refine the uris';

  var srcs =
  [
    '/some/staging/index.html',
    '/some/staging/index.html/',
    '//some/staging/index.html',
    '//some/staging/index.html/',
    '///some/staging/index.html',
    '///some/staging/index.html/',
    'file:///some/staging/index.html',
    'file:///some/staging/index.html/',
    'http://some.come/staging/index.html',
    'http://some.come/staging/index.html/',
    'svn+https://user@subversion.com/svn/trunk',
    'svn+https://user@subversion.com/svn/trunk/',
    'complex+protocol://www.site.com:13/path/name/?query=here&and=here#anchor',
    'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor',
    'https://web.archive.org/web/*/http://www.heritage.org/index/ranking',
    'https://web.archive.org//web//*//http://www.heritage.org//index//ranking',
    '://www.site.com:13/path//name//?query=here&and=here#anchor',
    ':///www.site.com:13/path//name/?query=here&and=here#anchor',
  ]

  var expected =
  [
    '/some/staging/index.html',
    '/some/staging/index.html',
    '//some/staging/index.html',
    '//some/staging/index.html',
    '///some/staging/index.html',
    '///some/staging/index.html',
    'file:///some/staging/index.html',
    'file:///some/staging/index.html',
    'http://some.come/staging/index.html',
    'http://some.come/staging/index.html',
    'svn+https://user@subversion.com/svn/trunk',
    'svn+https://user@subversion.com/svn/trunk',
    'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor',
    'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor',
    'https://web.archive.org/web/*/http://www.heritage.org/index/ranking',
    'https://web.archive.org//web//*//http://www.heritage.org//index//ranking',
    '://www.site.com:13/path//name//?query=here&and=here#anchor',
    ':///www.site.com:13/path//name?query=here&and=here#anchor'
  ]

  var got = _.uri.urisRefine( srcs );
  test.identical( got, expected );
}

//

function uriParse( test )
{

  var uri1 = 'http://www.site.com:13/path/name?query=here&and=here#anchor';

  test.case = 'full uri with all components';  /* */

  var expected =
  {
    protocol : 'http',
    host : 'www.site.com',
    port : '13',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',
    protocols : [ 'http' ],
    hostWithPort : 'www.site.com:13',
    origin : 'http://www.site.com:13',
    full : 'http://www.site.com:13/path/name?query=here&and=here#anchor',
  }

  var got = _.uri.uriParse( uri1 );
  test.identical( got, expected );

  test.case = 'full uri with all components, primitiveOnly'; /* */

  var expected =
  {
    protocol : 'http',
    host : 'www.site.com',
    port : '13',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',
  }

  var got = _.uri.uriParsePrimitiveOnly( uri1 );
  test.identical( got, expected );

  test.case = 'reparse with non primitives';

  var expected =
  {
    protocol : 'http',
    host : 'www.site.com',
    port : '13',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',

    protocols : [ 'http' ],
    hostWithPort : 'www.site.com:13',
    origin : 'http://www.site.com:13',
    full : 'http://www.site.com:13/path/name?query=here&and=here#anchor',

  }

  var parsed = got;
  var got = _.uri.uriParse( parsed );
  test.identical( got, expected );

  test.case = 'reparse with primitives';

  var uri1 = 'http://www.site.com:13/path/name?query=here&and=here#anchor';
  var expected =
  {
    protocol : 'http',
    host : 'www.site.com',
    port : '13',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',
  }

  var got = _.uri.uriParsePrimitiveOnly( uri1 );
  test.identical( got, expected );

  test.case = 'uri with zero length protocol'; /* */

  var uri = '://some.domain.com/something/to/add';

  var expected =
  {
    protocol : '',
    host : 'some.domain.com',
    localPath : '/something/to/add',
    protocols : [ '' ],
    hostWithPort : 'some.domain.com',
    origin : '://some.domain.com',
    full : '://some.domain.com/something/to/add',
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  test.case = 'uri with zero length hostWithPort'; /* */

  var uri = 'file:///something/to/add';

  var expected =
  {
    protocol : 'file',
    host : '',
    localPath : '/something/to/add',
    protocols : [ 'file' ],
    hostWithPort : '',
    origin : 'file://',
    full : 'file:///something/to/add',
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  test.case = 'uri with double protocol'; /* */

  var uri = 'svn+https://user@subversion.com/svn/trunk';

  var expected =
  {
    protocol : 'svn+https',
    host : 'user@subversion.com',
    localPath : '/svn/trunk',
    protocols : [ 'svn','https' ],
    hostWithPort : 'user@subversion.com',
    origin : 'svn+https://user@subversion.com',
    full : 'svn+https://user@subversion.com/svn/trunk',
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  test.case = 'simple path'; /* */

  var uri = '/some/file';

  var expected =
  {
    localPath : '/some/file',
    protocols : [],
    full : '/some/file',
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  test.case = 'simple path'; /* */

  var uri = '//some.domain.com/was';
  var expected =
  {
    host : 'some.domain.com',
    localPath : '/was',
    protocols : [],
    hostWithPort : 'some.domain.com',
    origin : '//some.domain.com',
    full : '//some.domain.com/was',
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  test.case = 'simple path'; /* */

  var uri = '//';
  var expected =
  {
    host : '',
    localPath : '',
    protocols : [],
    hostWithPort : '',
    origin : '//',
    full : '//'
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  var uri = '///';
  var expected =
  {
    host : '',
    localPath : '/',
    protocols : [],
    hostWithPort : '',
    origin : '//',
    full : '///'
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );

  var uri = '///a/b/c';
  var expected =
  {
    host : '',
    localPath : '/a/b/c',
    protocols : [],
    hostWithPort : '',
    origin : '//',
    full : '///a/b/c'
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected )

  test.case = 'complex';
  var uri = 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor';
  var expected =
  {
    protocol : 'complex+protocol',
    host : 'www.site.com',
    localPath : '/path/name',
    port : '13',
    query : 'query=here&and=here',
    hash : 'anchor',
    protocols : [ 'complex', 'protocol' ],
    hostWithPort : 'www.site.com:13',
    origin : 'complex+protocol://www.site.com:13',
    full : uri
  }

  var got = _.uri.uriParse( uri );
  test.identical( got, expected );


  test.case = 'complex, parsePrimitiveOnly + uriStr';
  var uri = 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor';
  var got = _.uri.uriParsePrimitiveOnly( uri );
  var expected =
  {
    protocol : 'complex+protocol',
    host : 'www.site.com',
    localPath : '/path/name',
    port : '13',
    query : 'query=here&and=here',
    hash : 'anchor',
  }
  test.identical( got, expected );
  var newUrl = _.uri.uriStr( got );
  test.identical( newUrl, uri );

  var uri = '://www.site.com:13/path//name//?query=here&and=here#anchor';
  var got = _.uri.uriParse( uri );
  var expected =
  {
    protocol : '',
    host : 'www.site.com',
    localPath : '/path//name//',
    port : '13',
    query : 'query=here&and=here',
    hash : 'anchor',
    protocols : [ '' ],
    hostWithPort : 'www.site.com:13',
    origin : '://www.site.com:13',
    full : uri
  }
  test.identical( got, expected );

  var uri = '://www.site.com:13/path//name//?query=here&and=here#anchor';
  var got = _.uri.uriParsePrimitiveOnly( uri );
  var expected =
  {
    protocol : '',
    host : 'www.site.com',
    localPath : '/path//name//',
    port : '13',
    query : 'query=here&and=here',
    hash : 'anchor',
  }
  test.identical( got, expected );

  var uri = ':///www.site.com:13/path//name//?query=here&and=here#anchor';
  var got = _.uri.uriParse( uri );
  var expected =
  {
    protocol : '',
    host : '',
    localPath : '/www.site.com:13/path//name//',
    query : 'query=here&and=here',
    hash : 'anchor',
    protocols : [ '' ],
    hostWithPort : '',
    origin : '://',
    full : uri
  }
  test.identical( got, expected );

  var uri = ':///www.site.com:13/path//name//?query=here&and=here#anchor';
  var got = _.uri.uriParsePrimitiveOnly( uri );
  var expected =
  {
    protocol : '',
    host : '',
    localPath : '/www.site.com:13/path//name//',
    query : 'query=here&and=here',
    hash : 'anchor',
  }
  test.identical( got, expected );

  if( Config.debug )  /* */
  {

    test.case = 'missed arguments';
    test.shouldThrowErrorSync( function()
    {
      _.uri.uriParse();
    });

    test.case = 'redundant argument';
    test.shouldThrowErrorSync( function()
    {
      _.uri.uriParse( 'http://www.site.com:13/path/name?query=here&and=here#anchor','' );
    });

    test.case = 'argument is not string';
    test.shouldThrowErrorSync( function()
    {
      _.uri.uriParse( 34 );
    });

  }

}

//

function uriStr( test )
{
  var uri = 'http://www.site.com:13/path/name?query=here&and=here#anchor';
  var components0 =
  {
    full : uri
  }

  var components2 =
  {
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',

    origin: 'http://www.site.com:13'
  }

  var components3 =
  {
    protocol : 'http',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',

    hostWithPort : 'www.site.com:13'
  }

  var expected1 = uri;

  test.case = 'make uri from components uri';  /* */
  var got = _.uri.uriStr( components0 );
  test.identical( got, expected1 );

  test.case = 'make uri from atomic components'; /* */

  var components =
  {
    protocol : 'http',
    host : 'www.site.com',
    port : '13',
    localPath : '/path/name',
    query : 'query=here&and=here',
    hash : 'anchor',
  }

  var got = _.uri.uriStr( components );
  test.identical( got, expected1 );

  /* */

  test.case = 'make uri from composites components: origin';
  var got = _.uri.uriStr( components2 );
  test.identical( got, expected1 );

  /* */

  test.case = 'make uri from composites components: hostWithPort';
  var got = _.uri.uriStr( components3 );
  test.identical( got, expected1 );

  /* */

  test.case = 'make uri from composites components: hostWithPort';
  var expected = '//some.domain.com/was';
  var components =
  {
    host : 'some.domain.com',
    localPath : '/was',
  }

  var got = _.uri.uriStr( components );
  test.identical( got, expected );

  /* */

  test.case = 'no host, but protocol'

  var components =
  {
    localPath : '/some2',
    protocol : 'src',
  }
  var expected = 'src:///some2';
  debugger;
  var got = _.uri.uriStr( components );
  test.identical( got, expected );

  var components =
  {
    localPath : 'some2',
    protocol : 'src',
  }
  var expected = 'src:///some2';
  var got = _.uri.uriStr( components );
  test.identical( got, expected );

  //

  var uri = '/some/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  debugger;
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//some/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//www.site.com/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '///index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  debugger;
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//www.site.com:/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//www.site.com:13/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//www.site.com:13/index.html?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '///some/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '///some.com:99/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '///some.com:99/staging/index.html?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'file:///some/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'file:///some.com:/staging/index.html?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'http://some.come/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'http://some.come:88/staging/index.html';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'http://some.come:88/staging/?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'svn+https://user@subversion.com/svn/trunk';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'svn+https://user@subversion.com:99/svn/trunk';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'complex+protocol://www.site.com:13/path/name?';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'complex+protocol://www.site.com:13/path/name?#';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'https://web.archive.org/web/*/http://www.heritage.org/index/ranking';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '://www.site.com:13/path//name//?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = ':///www.site.com:13/path//name//?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = 'protocol://';
  var parsed = _.uri.uriParse( uri );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//:99';
  var parsed = _.uri.uriParse( uri );
  test.identical( parsed.port, '99' );
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  test.identical( parsedPrimitive.port, '99' );
  var fromParsed = _.uri.uriStr( parsed );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsed, uri );
  test.identical( fromParsedPrimitive, uri );

  var uri = '//?q=1#x';
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var parsed = _.uri.uriParse( uri );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsedPrimitive, uri );
  var fromParsed = _.uri.uriStr( parsed );
  test.identical( fromParsed, uri );

  var uri = '//';
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var parsed = _.uri.uriParse( uri );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsedPrimitive, uri );
  var fromParsed = _.uri.uriStr( parsed );
  test.identical( fromParsed, uri );

  var uri = '//a/b/c';
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var parsed = _.uri.uriParse( uri );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsedPrimitive, uri );
  var fromParsed = _.uri.uriStr( parsed );
  test.identical( fromParsed, uri );

  var uri = '///';
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var parsed = _.uri.uriParse( uri );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsedPrimitive, uri );
  var fromParsed = _.uri.uriStr( parsed );
  test.identical( fromParsed, uri );

  var uri = '///a/b/c';
  var parsedPrimitive = _.uri.uriParsePrimitiveOnly( uri );
  var parsed = _.uri.uriParse( uri );
  var fromParsedPrimitive = _.uri.uriStr( parsedPrimitive );
  test.identical( fromParsedPrimitive, uri );
  var fromParsed = _.uri.uriStr( parsed );
  test.identical( fromParsed, uri );

  //

  if( Config.debug )
  {

    test.case = 'missed arguments';
    test.shouldThrowErrorSync( function()
    {
      _.uri.uriStr();
    });

    test.case = 'argument is not uri component object';
    test.shouldThrowErrorSync( function()
    {
      debugger
      _.uri.uriStr( uri );
    });

  }
}

//

function uriFor( test )
{
  var uriString = 'http://www.site.com:13/path/name?query=here&and=here#anchor';
  var options1 =
  {
    full : uriString,
  }
  var expected1 = uriString;

  test.case = 'call with options.uri';
  var got = _.uri.uriFor( options1 );
  test.contains( got, expected1 );

  if( Config.debug )
  {

    test.case = 'missed arguments';
    test.shouldThrowErrorSync( function()
    {
      _.uri.uriFor();
    });

  }
}

//

function uriDocument( test )
{

  var uri1 = 'https://www.site.com:13/path/name?query=here&and=here#anchor',
    uri2 = 'www.site.com:13/path/name?query=here&and=here#anchor',
    uri3 = 'http://www.site.com:13/path/name',
    options1 = { withoutServer: 1 },
    options2 = { withoutProtocol: 1 },
    expected1 = 'https://www.site.com:13/path/name',
    expected2 = 'http://www.site.com:13/path/name',
    expected3 = 'www.site.com:13/path/name',
    expected4 = '/path/name';

  test.case = 'full components uri';
  var got = _.uri.uriDocument( uri1 );
  test.contains( got, expected1 );

  test.case = 'uri without protocol';
  var got = _.uri.uriDocument( uri2 );
  test.contains( got, expected2 );

  test.case = 'uri without query, options withoutProtocol = 1';
  var got = _.uri.uriDocument( uri3, options2 );
  test.contains( got, expected3 );

  test.case = 'get path only';
  var got = _.uri.uriDocument( uri1, options1 );
  test.contains( got, expected4 );

}

//

function uriServer( test )
{
  var uriString = 'http://www.site.com:13/path/name?query=here&and=here#anchor';
  var expected = 'http://www.site.com:13/';

  test.case = 'get server part of uri';
  var got = _.uri.uriServer( uriString );
  test.contains( got, expected );

}

//

function uriQuery( test )
{
  var uriString = 'http://www.site.com:13/path/name?query=here&and=here#anchor',
    expected = 'query=here&and=here#anchor';

  test.case = 'get query part of uri';
  var got = _.uri.uriQuery( uriString );
  test.contains( got, expected );

}

//

function uriDequery( test )
{
  var query1 = 'key=value',
    query2 = 'key1=value1&key2=value2&key3=value3',
    query3 = 'k1=&k2=v2%20v3&k3=v4_v4',
    expected1 = { key: 'value' },
    expected2 =
    {
      key1 : 'value1',
      key2 : 'value2',
      key3 : 'value3'
    },
    expected3 =
    {
      k1: '',
      k2: 'v2 v3',
      k3: 'v4_v4'
    };

  test.case = 'parse simpliest query';
  var got = _.uri.uriDequery( query1 );
  test.contains( got, expected1 );

  test.case = 'parse query with several key/value pair';
  var got = _.uri.uriDequery( query2 );
  test.contains( got, expected2 );

  test.case = 'parse query with several key/value pair and decoding';
  var got = _.uri.uriDequery( query3 );
  test.contains( got, expected3 );

  // test.case = 'parse query with similar keys';
  // var got = _.uri.uriDequery( query4 );
  // test.contains( got, expected4 );

}

//

function _uriJoin_body( test )
{

  var paths1 = [ 'http://www.site.com:13/', 'bar', 'foo', ];
  var paths2 = [ 'c:\\', 'foo\\', 'bar\\' ];
  var paths3 = [ '/bar/', '/', 'foo/' ];
  var paths4 = [ '/bar/', '/baz', 'foo/' ];

  var expected1 = 'http://www.site.com:13/bar/foo';
  var expected2 = '/c/foo/bar';
  var expected3 = '/foo';
  var expected4 = '/bar/baz/foo';

  test.case = 'join URI';
  var got = _.uri._uriJoin_body
  ({
    paths : paths1,
    reroot : 0,
    isUri : 1,
  });
  test.identical( got, expected1 );

  test.case = 'join windows os paths';
  var got = _.uri._uriJoin_body
  ({
    paths : paths2,
    reroot : 0,
    isUri : 0,
  });
  test.identical( got, expected2 );

  test.case = 'join unix os paths';
  var got = _.uri._uriJoin_body
  ({
    paths : paths3,
    reroot : 0,
    isUri : 0,
  });
  test.identical( got, expected3 );

  test.case = 'join unix os paths with reroot';
  var got = _.uri._uriJoin_body
  ({
    paths : paths4,
    reroot : 1,
    isUri : 0,
  });
  test.identical( got, expected4 );

  test.case = 'join reroot with /';
  var got = _.uri._uriJoin_body
  ({
    paths : [ '/','/a/b' ],
    reroot : 1,
    isUri : 0,
  });
  test.identical( got, '/a/b' );

  if( !Config.debug )
  return;

  test.case = 'missed arguments';
  test.shouldThrowErrorSync( function()
  {
    _.uri._uriJoin_body();
  });

  test.case = 'path element is not string';
  test.shouldThrowErrorSync( function()
  {
    _.uri._uriJoin_body( _.mapSupplement( { paths : [ 34 , 'foo/' ] },options3 ) );
  });

  test.case = 'missed options';
  test.shouldThrowErrorSync( function()
  {
    _.uri._uriJoin_body( paths1 );
  });

  test.case = 'options has unexpected parameters';
  test.shouldThrowErrorSync( function()
  {
    debugger;
    _.uri._uriJoin_body({ paths : paths1, wrongParameter : 1 });
    debugger;
  });

  test.case = 'options does not has paths';
  test.shouldThrowErrorSync( function()
  {
    _.uri._uriJoin_body({ wrongParameter : 1 });
  });

}

//

function uriJoin( test )
{

  test.case = 'join different protocols';

  var got = _.uri.uriJoin( 'file://www.site.com:13','a','http:///dir','b' );
  var expected = 'http:///dir/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'file:///d','a','http:///dir','b' );
  var expected = 'http:///dir/b';
  test.identical( got, expected );

  test.case = 'join same protocols';

  var got = _.uri.uriJoin( 'http://www.site.com:13','a','http:///dir','b' );
  var expected = 'http://www.site.com:13/dir/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http:///www.site.com:13','a','http:///dir','b' );
  var expected = 'http:///dir/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http://server1','a','http://server2','b' );
  var expected = 'http://server2/a/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http:///server1','a','http://server2','b' );
  var expected = 'http://server2/server1/a/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http://server1','a','http:///server2','b' );
  var expected = 'http://server1/server2/b';
  test.identical( got, expected );

  test.case = 'join protocol with protocol-less';

  var got = _.uri.uriJoin( 'http://www.site.com:13','a',':///dir','b' );
  var expected = 'http://www.site.com:13/dir/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http:///www.site.com:13','a','://dir','b' );
  var expected = 'http://dir/www.site.com:13/a/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http:///www.site.com:13','a',':///dir','b' );
  var expected = 'http:///dir/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http://www.site.com:13','a','://dir','b' );
  var expected = 'http://dir/a/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http://dir:13','a','://dir','b' );
  var expected = 'http://dir:13/a/b';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'http://www.site.com:13','a','://:14','b' );
  var expected = 'http://www.site.com:14/a/b';
  test.identical( got, expected );

  /**/

  var got = _.uri.uriJoin( 'a','://dir1/x','b','http://dir2/y','c' );
  var expected = 'http://dir2/y/c';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'a',':///dir1/x','b','http://dir2/y','c' );
  var expected = 'http://dir2/y/c';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'a','://dir1/x','b','http:///dir2/y','c' );
  var expected = 'http://dir1/dir2/y/c';
  test.identical( got, expected );

  var got = _.uri.uriJoin( 'a',':///dir1/x','b','http:///dir2/y','c' );
  var expected = 'http:///dir2/y/c';
  test.identical( got, expected );

  /* */

  test.case = 'server join absolute path 1';
  var got = _.uri.uriJoin( 'http://www.site.com:13','/x','/y','/z' );
  test.identical( got, 'http://www.site.com:13/z' );

  test.case = 'server join absolute path 2';
  var got = _.uri.uriJoin( 'http://www.site.com:13/','x','/y','/z' );
  test.identical( got, 'http://www.site.com:13/z' );

  test.case = 'server join absolute path 2';
  var got = _.uri.uriJoin( 'http://www.site.com:13/','x','y','/z' );
  test.identical( got, 'http://www.site.com:13/z' );

  test.case = 'server join absolute path';
  var got = _.uri.uriJoin( 'http://www.site.com:13/','x','/y','z' );
  test.identical( got, 'http://www.site.com:13/y/z' );

  test.case = 'server join relative path';
  var got = _.uri.uriJoin( 'http://www.site.com:13/','x','y','z' );
  test.identical( got, 'http://www.site.com:13/x/y/z' );

  test.case = 'server with path join absolute path 2';
  var got = _.uri.uriJoin( 'http://www.site.com:13/ab','/y','/z' );
  test.identical( got, 'http://www.site.com:13/z' );

  test.case = 'server with path join absolute path 2';
  var got = _.uri.uriJoin( 'http://www.site.com:13/ab','/y','z' );
  test.identical( got, 'http://www.site.com:13/y/z' );

  test.case = 'server with path join absolute path 2';
  var got = _.uri.uriJoin( 'http://www.site.com:13/ab','y','z' );
  test.identical( got, 'http://www.site.com:13/ab/y/z' );

  test.case = 'add relative to uri with no localPath';
  var got = _.uri.uriJoin( 'https://some.domain.com/','something/to/add' );
  test.identical( got, 'https://some.domain.com/something/to/add' );

  test.case = 'add relative to uri with localPath';
  var got = _.uri.uriJoin( 'https://some.domain.com/was','something/to/add' );
  test.identical( got, 'https://some.domain.com/was/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'https://some.domain.com/was','/something/to/add' );
  test.identical( got, 'https://some.domain.com/something/to/add' );

  //

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '//some.domain.com/was','/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '://some.domain.com/was','/something/to/add' );
  test.identical( got, '://some.domain.com/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '//some.domain.com/was', 'x', '/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '://some.domain.com/was', 'x', '/something/to/add' );
  test.identical( got, '://some.domain.com/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '//some.domain.com/was', '/something/to/add', 'x' );
  test.identical( got, '/something/to/add/x' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '://some.domain.com/was', '/something/to/add', 'x' );
  test.identical( got, '://some.domain.com/something/to/add/x' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '//some.domain.com/was', '/something/to/add', '/x' );
  test.identical( got, '/x' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '://some.domain.com/was', '/something/to/add', '/x' );
  test.identical( got, '://some.domain.com/x' );

  //

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '/some/staging/index.html','/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '/some/staging/index.html', 'x', '/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '/some/staging/index.html', 'x', '/something/to/add', 'y' );
  test.identical( got, '/something/to/add/y' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '/some/staging/index.html','/something/to/add', '/y' );
  test.identical( got, '/y' );

  //

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '///some/staging/index.html','/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( ':///some/staging/index.html','/something/to/add' );
  test.identical( got, ':///something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '///some/staging/index.html', 'x', '/something/to/add' );
  test.identical( got, '/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( ':///some/staging/index.html', 'x', '/something/to/add' );
  test.identical( got, ':///something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '///some/staging/index.html', 'x', '/something/to/add', 'y' );
  test.identical( got, '/something/to/add/y' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( ':///some/staging/index.html', 'x', '/something/to/add', 'y' );
  test.identical( got, ':///something/to/add/y' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '///some/staging/index.html','/something/to/add', '/y' );
  test.identical( got, '/y' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( ':///some/staging/index.html','/something/to/add', '/y' );
  test.identical( got, ':///y' );

  //

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'svn+https://user@subversion.com/svn/trunk','/something/to/add' );
  test.identical( got, 'svn+https://user@subversion.com/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'svn+https://user@subversion.com/svn/trunk', 'x', '/something/to/add' );
  test.identical( got, 'svn+https://user@subversion.com/something/to/add' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'svn+https://user@subversion.com/svn/trunk', 'x', '/something/to/add', 'y' );
  test.identical( got, 'svn+https://user@subversion.com/something/to/add/y' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'svn+https://user@subversion.com/svn/trunk','/something/to/add', '/y' );
  test.identical( got, 'svn+https://user@subversion.com/y' );

  //

  var uri = 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor';
  var parsed = _.uri.uriParse( uri );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( uri,'/something/to/add' );
  test.identical( got, parsed.origin + '/something/to/add' + '?query=here&and=here#anchor' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( uri, 'x', '/something/to/add' );
  test.identical( got, parsed.origin + '/something/to/add' + '?query=here&and=here#anchor' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( uri, 'x', '/something/to/add', 'y' );
  test.identical( got, parsed.origin + '/something/to/add/y' + '?query=here&and=here#anchor' );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( uri,'/something/to/add', '/y' );
  test.identical( got, parsed.origin + '/y' + '?query=here&and=here#anchor' );

  //

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( '://some.domain.com/was','/something/to/add' );
  test.identical( got, '://some.domain.com/something/to/add' );

  var uri = '://user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x'  );
  var expected = '://user:pass@sub.host.com:8080/p/a/t/h/x?query=string#hash'
  test.identical( got, expected );

  var uri = '://user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x', '/y'  );
  var expected = '://user:pass@sub.host.com:8080/y?query=string#hash'
  test.identical( got, expected );

  var uri = '://user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, '/x//y//z'  );
  var expected = '://user:pass@sub.host.com:8080/x//y//z?query=string#hash'
  test.identical( got, expected );

  var uri = '://user:pass@sub.host.com:8080/p//a//t//h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x/'  );
  var expected = '://user:pass@sub.host.com:8080/p//a//t//h/x?query=string#hash'
  test.identical( got, expected );

  var uri = ':///user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x'  );
  var expected = ':///user:pass@sub.host.com:8080/p/a/t/h/x?query=string#hash'
  test.identical( got, expected );

  var uri = ':///user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x', '/y'  );
  var expected = ':///y?query=string#hash'
  test.identical( got, expected );

  var uri = ':///user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, '/x//y//z'  );
  var expected = ':///x//y//z?query=string#hash'
  test.identical( got, expected );

  var uri = ':///user:pass@sub.host.com:8080/p/a/t/h?query=string#hash';
  var got = _.uri.uriJoin( uri, 'x/'  );
  var expected = ':///user:pass@sub.host.com:8080/p/a/t/h/x?query=string#hash'
  test.identical( got, expected );

  test.case = 'add absolute to uri with localPath';
  var got = _.uri.uriJoin( 'file:///some/file','/something/to/add' );
  test.identical( got, 'file:///something/to/add' );

  //

  test.case = 'add uris';

  var got = _.uri.uriJoin( '//a', '//b', 'c' );
  test.identical( got, '//b/c' )

  var got = _.uri.uriJoin( 'b://c', 'd://e', 'f' );
  test.identical( got, 'd://e/f' );

  var got = _.uri.uriJoin( 'a://b', 'c://d/e', '//f/g' );
  test.identical( got, 'c://d//f/g' )

  //

  test.case = 'works like pathJoin';
  var paths = [ 'c:\\', 'foo\\', 'bar\\' ];
  var expected = '/c/foo/bar';
  var got = _.uri.uriJoin.apply( _.uri, paths );
  test.identical( got, expected );

  test.case = 'join unix os paths';
  var paths = [ '/bar/', '/baz', 'foo/', '.' ];
  var expected = '/baz/foo/.';
  var got = _.uri.uriJoin.apply( _.uri, paths );
  test.identical( got, expected );

  test.case = 'more complicated cases'; /* */

  /* qqq */

  var paths = [  '/aa', 'bb//', 'cc' ];
  var expected = '/aa/bb//cc';
  var got = _.uri.uriJoin.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/aa', 'bb//', 'cc','.' ];
  var expected = '/aa/bb//cc/.';
  var got = _.uri.uriJoin.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/','a', '//b', '././c', '../d', '..e' ];
  var expected = '//b/././c/../d/..e';
  var got = _.uri.uriJoin.apply( _.uri, paths );
  test.identical( got, expected );

/*
  _.uri.uriJoin( 'https://some.domain.com/','something/to/add' ) -> 'https://some.domain.com/something/to/add'
  _.uri.uriJoin( 'https://some.domain.com/was','something/to/add' ) -> 'https://some.domain.com/was/something/to/add'
  _.uri.uriJoin( 'https://some.domain.com/was','/something/to/add' ) -> 'https://some.domain.com/something/to/add'

  _.uri.uriJoin( '//some.domain.com/was','/something/to/add' ) -> '//some.domain.com/something/to/add'
  _.uri.uriJoin( '://some.domain.com/was','/something/to/add' ) -> '://some.domain.com/something/to/add'

/some/staging/index.html
//some/staging/index.html
///some/staging/index.html
file:///some/staging/index.html
http://some.come/staging/index.html
svn+https://user@subversion.com/svn/trunk
complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor

*/

}

//

function uriCommon( test )
{

  var got = _.uri.uriCommon([ '/a1/b2', '://some/staging/index.html' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ '://some/staging/index.html', '/a1/b2' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ '://some/staging/index.html', '://some/staging/' ]);
  test.identical( got, '://some/staging' );

  var got = _.uri.uriCommon([ '://some/staging/index.html', '://some/stagi' ]);
  test.identical( got, '://some/' );

  var got = _.uri.uriCommon([ 'file:///some/staging/index.html', '/some/stagi' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ 'file:///some/staging/index.html', '://some/stagi' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ 'file:///some/staging/index.html', 'file:///some/staging' ]);
  test.identical( got, 'file:///some/staging' );

  var got = _.uri.uriCommon([ 'http://some.come/staging/index.html', '/some/staging' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ 'http://some.come/staging/index.html', 'file:///some/staging' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ 'http://some.come/staging/index.html', 'http:///some/staging/file.html' ]);
  test.identical( got, '' );

  var got = _.uri.uriCommon([ 'http://some.come/staging/index.html', 'http://some.come/some/staging/file.html' ]);
  test.identical( got, 'http://some.come/' );

  var got = _.uri.uriCommon([ 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor', 'complex+protocol://www.site.com:13/path' ]);
  test.identical( got, 'complex+protocol://www.site.com:13/path' );

  var got = _.uri.uriCommon([ 'https://user:pass@sub.host.com:8080/p/a/t/h?query=string#hash', 'https://user:pass@sub.host.com:8080/p/a' ]);
  test.identical( got, 'https://user:pass@sub.host.com:8080/p/a' );

  var got = _.uri.uriCommon([ '://some/staging/a/b/c', '://some/staging/a/b/c/index.html', '://some/staging/a/x' ]);
  test.identical( got, '://some/staging/a' );

}

//

function uriCommonLocalPaths( test )
{
  test.case = 'absolute-absolute'

  var got = _.uri.uriCommon([ '/a1/b2', '/a1/b' ]);
  test.identical( got, '/a1/' );

  var got = _.uri.uriCommon([ '/a1/b2', '/a1/b1' ]);
  test.identical( got, '/a1/' );

  var got = _.uri.uriCommon([ '/a1/x/../b1', '/a1/b1' ]);
  test.identical( got, '/a1/b1' );

  var got = _.uri.uriCommon([ '/a1/b1/c1', '/a1/b1/c' ]);
  test.identical( got, '/a1/b1/' );

  var got = _.uri.uriCommon([ '/a1/../../b1/c1', '/a1/b1/c1' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/abcd', '/ab' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/.a./.b./.c.', '/.a./.b./.c' ]);
  test.identical( got, '/.a./.b./' );

  var got = _.uri.uriCommon([ '//a//b//c', '/a/b' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/a//b', '/a//b' ]);
  test.identical( got, '/a//b' );

  var got = _.uri.uriCommon([ '/a//', '/a//' ]);
  test.identical( got, '/a//' );

  var got = _.uri.uriCommon([ '/./a/./b/./c', '/a/b' ]);
  test.identical( got, '/a/b' );

  var got = _.uri.uriCommon([ '/A/b/c', '/a/b/c' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/', '/x' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/a', '/x'  ]);
  test.identical( got, '/' );

  test.case = 'absolute-relative'

  var got = _.uri.uriCommon([ '/', '..' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/', '.' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/', 'x' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/', '../..' ]);
  test.identical( got, '/' );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a', '..' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a', '.' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a', 'x' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a', '../..' ]) );

  test.case = 'relative-relative'

  var got = _.uri.uriCommon([ 'a1/b2', 'a1/b' ]);
  test.identical( got, 'a1/' );

  var got = _.uri.uriCommon([ 'a1/b2', 'a1/b1' ]);
  test.identical( got, 'a1/' );

  var got = _.uri.uriCommon([ 'a1/x/../b1', 'a1/b1' ]);
  test.identical( got, 'a1/b1' );

  var got = _.uri.uriCommon([ './a1/x/../b1', 'a1/b1' ]);
  test.identical( got,'a1/b1' );

  var got = _.uri.uriCommon([ './a1/x/../b1', './a1/b1' ]);
  test.identical( got, 'a1/b1');

  var got = _.uri.uriCommon([ './a1/x/../b1', '../a1/b1' ]);
  test.identical( got, '..');

  var got = _.uri.uriCommon([ '.', '..' ]);
  test.identical( got, '..' );

  var got = _.uri.uriCommon([ './b/c', './x' ]);
  test.identical( got, '.' );

  var got = _.uri.uriCommon([ './././a', './a/b' ]);
  test.identical( got, 'a' );

  var got = _.uri.uriCommon([ './a/./b', './a/b' ]);
  test.identical( got, 'a/b' );

  var got = _.uri.uriCommon([ './a/./b', './a/c/../b' ]);
  test.identical( got, 'a/b' );

  var got = _.uri.uriCommon([ '../b/c', './x' ]);
  test.identical( got, '..' );

  var got = _.uri.uriCommon([ '../../b/c', '../b' ]);
  test.identical( got, '../..' );

  var got = _.uri.uriCommon([ '../../b/c', '../../../x' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ '../../b/c/../../x', '../../../x' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ './../../b/c/../../x', './../../../x' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ '../../..', './../../..' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ './../../..', './../../..' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ '../../..', '../../..' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ '../b', '../b' ]);
  test.identical( got, '../b' );

  var got = _.uri.uriCommon([ '../b', './../b' ]);
  test.identical( got, '../b' );

  test.case = 'several absolute paths'

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/a/b/c' ]);
  test.identical( got, '/a/b/c' );

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/a/b' ]);
  test.identical( got, '/a/b' );

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/a/b1' ]);
  test.identical( got, '/a' );

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/a' ]);
  test.identical( got, '/a' );

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/x' ]);
  test.identical( got, '/' );

  var got = _.uri.uriCommon([ '/a/b/c', '/a/b/c', '/' ]);
  test.identical( got, '/' );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a/b/c', '/a/b/c', './' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a/b/c', '/a/b/c', '.' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ 'x', '/a/b/c', '/a' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '/a/b/c', '..', '/a' ]) );

  test.shouldThrowError( () => _.uri.uriCommon([ '../..', '../../b/c', '/a' ]) );

  test.case = 'several relative paths';

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', 'a/b/c' ]);
  test.identical( got, 'a/b/c' );

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', 'a/b' ]);
  test.identical( got, 'a/b' );

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', 'a/b1' ]);
  test.identical( got, 'a' );

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', '.' ]);
  test.identical( got, '.' );

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', 'x' ]);
  test.identical( got, '.' );

  var got = _.uri.uriCommon([ 'a/b/c', 'a/b/c', './' ]);
  test.identical( got, '.' );

  var got = _.uri.uriCommon([ '../a/b/c', 'a/../b/c', 'a/b/../c' ]);
  test.identical( got, '..' );

  var got = _.uri.uriCommon([ './a/b/c', '../../a/b/c', '../../../a/b' ]);
  test.identical( got, '../../..' );

  var got = _.uri.uriCommon([ '.', './', '..' ]);
  test.identical( got, '..' );

  var got = _.uri.uriCommon([ '.', './../..', '..' ]);
  test.identical( got, '../..' );
}

//

function uriResolve( test )
{

  var pathCurrent = _.strPrependOnce( _.uri.pathCurrent(), '/' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a' );
  test.identical( got, 'http://www.site.com:13/a' );

  var got = _.uri.uriResolve( 'http://www.site.com:13/','a' );
  test.identical( got, 'http://www.site.com:13/a' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a', '/b' );
  test.identical( got, 'http://www.site.com:13/b' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a', '/b', 'c' );
  test.identical( got, 'http://www.site.com:13/b/c' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','/a/', '/b/', 'c/', '.' );
  test.identical( got, 'http://www.site.com:13/b/c' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a', '.', 'b' );
  test.identical( got, 'http://www.site.com:13/a/b' );

  var got = _.uri.uriResolve( 'http://www.site.com:13/','a', '.', 'b' );
  test.identical( got, 'http://www.site.com:13/a/b' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a', '..', 'b' );
  test.identical( got, 'http://www.site.com:13/b' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a', '..', '..', 'b' );
  test.identical( got, 'http://www.site.com:13/../b' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','.a.', 'b','.c.' );
  test.identical( got, 'http://www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( 'http://www.site.com:13/','.a.', 'b','.c.' );
  test.identical( got, 'http://www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( 'http://www.site.com:13','a/../' );
  test.identical( got, 'http://www.site.com:13/' );

  var got = _.uri.uriResolve( 'http://www.site.com:13/','a/../' );
  test.identical( got, 'http://www.site.com:13/' );

  //

  var got = _.uri.uriResolve( '://www.site.com:13','a' );
  test.identical( got, '://www.site.com:13/a' );

  var got = _.uri.uriResolve( '://www.site.com:13/','a' );
  test.identical( got, '://www.site.com:13/a' );

  var got = _.uri.uriResolve( '://www.site.com:13','a', '/b' );
  test.identical( got, '://www.site.com:13/b' );

  var got = _.uri.uriResolve( '://www.site.com:13','a', '/b', 'c' );
  test.identical( got, '://www.site.com:13/b/c' );

  var got = _.uri.uriResolve( '://www.site.com:13','/a/', '/b/', 'c/', '.' );
  test.identical( got, '://www.site.com:13/b/c' );

  var got = _.uri.uriResolve( '://www.site.com:13','a', '.', 'b' );
  test.identical( got, '://www.site.com:13/a/b' );

  var got = _.uri.uriResolve( '://www.site.com:13/','a', '.', 'b' );
  test.identical( got, '://www.site.com:13/a/b' );

  var got = _.uri.uriResolve( '://www.site.com:13','a', '..', 'b' );
  test.identical( got, '://www.site.com:13/b' );

  var got = _.uri.uriResolve( '://www.site.com:13','a', '..', '..', 'b' );
  test.identical( got, '://www.site.com:13/../b' );

  var got = _.uri.uriResolve( '://www.site.com:13','.a.', 'b','.c.' );
  test.identical( got, '://www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( '://www.site.com:13/','.a.', 'b','.c.' );
  test.identical( got, '://www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( '://www.site.com:13','a/../' );
  test.identical( got, '://www.site.com:13/' );

  var got = _.uri.uriResolve( '://www.site.com:13/','a/../' );
  test.identical( got, '://www.site.com:13/' );

  //

  var got = _.uri.uriResolve( ':///www.site.com:13','a' );
  test.identical( got, ':///www.site.com:13/a' );

  var got = _.uri.uriResolve( ':///www.site.com:13/','a' );
  test.identical( got, ':///www.site.com:13/a' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a', '/b' );
  test.identical( got, ':///b' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a', '/b', 'c' );
  test.identical( got, ':///b/c' );

  var got = _.uri.uriResolve( ':///www.site.com:13','/a/', '/b/', 'c/', '.' );
  test.identical( got, ':///b/c' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a', '.', 'b' );
  test.identical( got, ':///www.site.com:13/a/b' );

  var got = _.uri.uriResolve( ':///www.site.com:13/','a', '.', 'b' );
  test.identical( got, ':///www.site.com:13/a/b' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a', '..', 'b' );
  test.identical( got, ':///www.site.com:13/b' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a', '..', '..', 'b' );
  test.identical( got, ':///b' );

  var got = _.uri.uriResolve( ':///www.site.com:13','.a.', 'b','.c.' );
  test.identical( got, ':///www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( ':///www.site.com:13/','.a.', 'b','.c.' );
  test.identical( got, ':///www.site.com:13/.a./b/.c.' );

  var got = _.uri.uriResolve( ':///www.site.com:13','a/../' );
  test.identical( got, ':///www.site.com:13' );

  var got = _.uri.uriResolve( ':///www.site.com:13/','a/../' );
  test.identical( got, ':///www.site.com:13' );

  //

  var got = _.uri.uriResolve( '/some/staging/index.html','a' );
  test.identical( got, '/some/staging/index.html/a' );

  var got = _.uri.uriResolve( '/some/staging/index.html','.' );
  test.identical( got, '/some/staging/index.html' );

  var got = _.uri.uriResolve( '/some/staging/index.html/','a' );
  test.identical( got, '/some/staging/index.html/a' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a', '/b' );
  test.identical( got, '/b' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a', '/b', 'c' );
  test.identical( got, '/b/c' );

  var got = _.uri.uriResolve( '/some/staging/index.html','/a/', '/b/', 'c/', '.' );
  test.identical( got, '/b/c' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a', '.', 'b' );
  test.identical( got, '/some/staging/index.html/a/b' );

  var got = _.uri.uriResolve( '/some/staging/index.html/','a', '.', 'b' );
  test.identical( got, '/some/staging/index.html/a/b' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a', '..', 'b' );
  test.identical( got, '/some/staging/index.html/b' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a', '..', '..', 'b' );
  test.identical( got, '/some/staging/b' );

  var got = _.uri.uriResolve( '/some/staging/index.html','.a.', 'b','.c.' );
  test.identical( got, '/some/staging/index.html/.a./b/.c.' );

  var got = _.uri.uriResolve( '/some/staging/index.html/','.a.', 'b','.c.' );
  test.identical( got, '/some/staging/index.html/.a./b/.c.' );

  var got = _.uri.uriResolve( '/some/staging/index.html','a/../' );
  test.identical( got, '/some/staging/index.html' );

  var got = _.uri.uriResolve( '/some/staging/index.html/','a/../' );
  test.identical( got, '/some/staging/index.html' );

  var got = _.uri.uriResolve( '//some/staging/index.html', '.', 'a' );
  test.identical( got, '//some/staging/index.html/a' )

  var got = _.uri.uriResolve( '///some/staging/index.html', 'a', '.', 'b', '..' );
  test.identical( got, '///some/staging/index.html/a' )

  var got = _.uri.uriResolve( 'file:///some/staging/index.html', '../..' );
  test.identical( got, 'file:///some' )

  var got = _.uri.uriResolve( 'svn+https://user@subversion.com/svn/trunk', '../a', 'b', '../c' );
  test.identical( got, 'svn+https://user@subversion.com/svn/a/c' );

  var got = _.uri.uriResolve( 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor', '../../path/name' );
  test.identical( got, 'complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor' )

  var got = _.uri.uriResolve( 'https://web.archive.org/web/*\/http://www.heritage.org/index/ranking', '../../../a.com' );
  test.identical( got, 'https://web.archive.org/web/*\/http://a.com' )

  var got = _.uri.uriResolve( '127.0.0.1:61726', '../path'  );
  test.identical( got, _.uri.pathJoin( _.uri.pathCurrent(),'path' ) )

  var got = _.uri.uriResolve( 'http://127.0.0.1:61726', '../path'  );
  test.identical( got, 'http://127.0.0.1:61726/../path' )

  //

  test.case = 'works like uriResolve';

  var paths = [ 'c:\\', 'foo\\', 'bar\\' ];
  var expected = '/c/foo/bar';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [ '/bar/', '/baz', 'foo/', '.' ];
  var expected = '/baz/foo';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  'aa','.','cc' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'aa/cc' );
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  'aa','cc','.' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'aa/cc' )
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '.','aa','cc' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'aa/cc' )
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '.','aa','cc','..' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'aa' )
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '.','aa','cc','..','..' ];
  var expected = _.uri.pathCurrent();
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  'aa','cc','..','..','..' ];
  var expected = _.uri.pathResolve( _.uri.pathCurrent(),'..' );
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '.x.','aa','bb','.x.' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'.x./aa/bb/.x.' );
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '..x..','aa','bb','..x..' ];
  var expected = _.uri.pathJoin( _.uri.pathCurrent(),'..x../aa/bb/..x..' );
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','./../a/b' ];
  var expected = '/a/b';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','a/.././a/b' ];
  var expected = '/abc/a/b';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','.././a/b' ];
  var expected = '/a/b';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','./.././a/b' ];
  var expected = '/a/b';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','./../.' ];
  var expected = '/';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','./../../.' ];
  var expected = '/..';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );

  var paths = [  '/abc','./../.' ];
  var expected = '/';
  var got = _.uri.uriResolve.apply( _.uri, paths );
  test.identical( got, expected );
}

//

function uriRebase( test )
{

  test.case = 'replace by empty protocol';

  var expected = ':///some2/file'; /* not src:///some2/file */
  debugger;
  var got = _.uri.uriRebase( 'src:///some/file', '/some', ':///some2' );
  debugger;
  test.identical( got,expected );

  test.case = 'remove protocol';

  var expected = '/some2/file';
  var got = _.uri.uriRebase( 'src:///some/file', 'src:///some', '/some2' );
  test.identical( got,expected );

  var expected = 'src:///some2/file';
  var got = _.uri.uriRebase( 'src:///some/file', 'dst:///some', '/some2' );
  test.identical( got,expected );

}

//

function uriName( test )
{
  var paths =
  [
    // '',
    'some.txt',
    '/foo/bar/baz.asdf',
    '/foo/bar/.baz',
    '/foo.coffee.md',
    '/foo/bar/baz',
    '/some/staging/index.html',
    '//some/staging/index.html',
    '///some/staging/index.html',
    'file:///some/staging/index.html',
    'http://some.come/staging/index.html',
    'svn+https://user@subversion.com/svn/trunk/index.html',
    'complex+protocol://www.site.com:13/path/name.html?query=here&and=here#anchor',
    '://www.site.com:13/path/name.html?query=here&and=here#anchor',
    ':///www.site.com:13/path/name.html?query=here&and=here#anchor',
  ]

  var expectedExt =
  [
    // '',
    'some.txt',
    'baz.asdf',
    '.baz',
    'foo.coffee.md',
    'baz',
    'index.html',
    'index.html',
    'index.html',
    'index.html',
    'index.html',
    'index.html',
    'name.html',
    'name.html',
    'name.html',
  ]

  var expectedNoExt =
  [
    // '',
    'some',
    'baz',
    '',
    'foo.coffee',
    'baz',
    'index',
    'index',
    'index',
    'index',
    'index',
    'index',
    'name',
    'name',
    'name',
  ]

  test.case = 'uriName works like pathName'
  paths.forEach( ( path, i ) =>
  {
    var got = _.uri.uriName( path );
    var exp = expectedNoExt[ i ];
    test.identical( got, exp );

    var o = { path : path, withExtension : 1 };
    var got = _.uri.uriName( o );
    var exp = expectedExt[ i ];
    test.identical( got, exp );
  })

  //

  test.case = 'uri to file';
  var uri = 'http://www.site.com:13/path/name.txt'
  var got = _.uri.uriName( uri );
  var expected = 'name';
  test.identical( got, expected );

  test.case = 'uri with params';
  var uri1 = 'http://www.site.com:13/path/name?query=here&and=here#anchor';
  var got = _.uri.uriName( uri );
  var expected = 'name';
  test.identical( got, expected );

  test.case = 'uri without protocol';
  var uri1 = '://www.site.com:13/path/name.js';
  var got = _.uri.uriName( uri );
  var expected = 'name';
  test.identical( got, expected );

  if( !Config.debug )
  return;

  test.case = 'passed argument is non string';
  test.shouldThrowErrorSync( function()
  {
    _.uri.uriName( false );
  });
}

//

//

function uriExt( test )
{
  var paths =
  [
    // '',
    'some.txt',
    '/foo/bar/baz.asdf',
    '/foo/bar/.baz',
    '/foo.coffee.md',
    '/foo/bar/baz',
    '/some/staging/index.html',
    '//some/staging/index.html',
    '///some/staging/index.html',
    'file:///some/staging/index.html',
    'http://some.come/staging/index.html',
    'svn+https://user@subversion.com/svn/trunk/index.html',
    'complex+protocol://www.site.com:13/path/name.html?query=here&and=here#anchor',
    '://www.site.com:13/path/name.html?query=here&and=here#anchor',
    ':///www.site.com:13/path/name.html?query=here&and=here#anchor',
  ]

  var expected =
  [
    // '',
    'txt',
    'asdf',
    '',
    'md',
    '',
    'html',
    'html',
    'html',
    'html',
    'html',
    'html',
    'html',
    'html',
    'html',
  ]

  test.case = 'uriExt test'
  paths.forEach( ( path, i ) =>
  {
    test.logger.log( path )
    var got = _.uri.uriExt( path );
    var exp = expected[ i ];
    test.identical( got, exp );
  })

  if( !Config.debug )
  return;

  test.case = 'passed argument is non string';
  test.shouldThrowErrorSync( function()
  {
    _.uri.uriExt( false );
  });
}

//

function uriChangeExt( test )
{
  var paths =
  [
    { path : 'some.txt', ext : 'abc' },
    { path : '/foo/bar/baz.asdf', ext : 'abc' },
    { path : '/foo/bar/.baz', ext : 'abc' },
    { path : '/foo.coffee.md', ext : 'abc' },
    { path : '/foo/bar/baz', ext : 'abc' },
    { path : '/some/staging/index.html', ext : 'abc' },
    { path : '//some/staging/index.html', ext : 'abc' },
    { path : '///some/staging/index.html', ext : 'abc' },
    { path : 'file:///some/staging/index.html', ext : 'abc' },
    { path : 'http://some.come/staging/index.html', ext : 'abc' },
    { path : 'svn+https://user@subversion.com/svn/trunk/index.html', ext : 'abc' },
    { path : 'complex+protocol://www.site.com:13/path/name.html?query=here&and=here#anchor', ext : 'abc' },
    { path : '://www.site.com:13/path/name.html?query=here&and=here#anchor', ext : 'abc' },
    { path : ':///www.site.com:13/path/name.html?query=here&and=here#anchor', ext : 'abc' },
  ]

  var expected =
  [
    'some.abc',
    '/foo/bar/baz.abc',
    '/foo/bar/.baz.abc',
    '/foo.coffee.abc',
    '/foo/bar/baz.abc',
    '/some/staging/index.abc',
    '//some/staging/index.abc',
    '///some/staging/index.abc',
    'file:///some/staging/index.abc',
    'http://some.come/staging/index.abc',
    'svn+https://user@subversion.com/svn/trunk/index.abc',
    'complex+protocol://www.site.com:13/path/name.abc?query=here&and=here#anchor',
    '://www.site.com:13/path/name.abc?query=here&and=here#anchor',
    ':///www.site.com:13/path/name.abc?query=here&and=here#anchor',
  ]

  test.case = 'uriChangeExt test'
  paths.forEach( ( c, i ) =>
  {
    test.logger.log( c.path, c.ext )
    var got = _.uri.uriChangeExt( c.path, c.ext );
    var exp = expected[ i ];
    test.identical( got, exp );
  })

  if( !Config.debug )
  return;

  test.case = 'passed argument is non string';
  test.shouldThrowErrorSync( function()
  {
    _.uri.uriChangeExt( false );
  });
}

//

function uriDir( test )
{
  var paths =
  [
    'some.txt',
    '/foo/bar/baz.asdf',
    '/foo/bar/.baz',
    '/foo.coffee.md',
    '/foo/bar/baz',
    '/some/staging/index.html',
    '//some/staging/index.html',
    '///some/staging/index.html',
    'file:///some/staging/index.html',
    'http://some.come/staging/index.html',
    'svn+https://user@subversion.com/svn/trunk/index.html',
    'complex+protocol://www.site.com:13/path/name.html?query=here&and=here#anchor',
    '://www.site.com:13/path/name.html?query=here&and=here#anchor',
    ':///www.site.com:13/path/name.html?query=here&and=here#anchor',
  ]

  var expected =
  [
    '.',
    '/foo/bar',
    '/foo/bar',
    '/',
    '/foo/bar',
    '/some/staging',
    '//some/staging',
    '///some/staging',
    'file:///some/staging',
    'http://some.come/staging',
    'svn+https://user@subversion.com/svn/trunk',
    'complex+protocol://www.site.com:13/path?query=here&and=here#anchor',
    '://www.site.com:13/path?query=here&and=here#anchor',
    ':///www.site.com:13/path?query=here&and=here#anchor',
  ]

  test.case = 'uriDir test'
  paths.forEach( ( path, i ) =>
  {
    test.logger.log( path )
    var got = _.uri.uriDir( path );
    var exp = expected[ i ];
    test.identical( got, exp );
  })

  if( !Config.debug )
  return;

  test.case = 'passed argument is non string';
  test.shouldThrowErrorSync( function()
  {
    _.uri.uriDir( false );
  });
}

//

/*

a//b
a///b
127.0.0.1:61726

://some/staging/index.html
:///some/staging/index.html
/some/staging/index.html
file:///some/staging/index.html
http://some.come/staging/index.html
svn+https://user@subversion.com/svn/trunk
complex+protocol://www.site.com:13/path/name?query=here&and=here#anchor
https://web.archive.org/web/*\/http://www.heritage.org/index/ranking
https://user:pass@sub.host.com:8080/p/a/t/h?query=string#hash
*/

// --
// define class
// --

var Self =
{

  name : 'Tools/base/layer4/UrlFundamentals',
  silencing : 1,

  tests :
  {
    uriNormalize : uriNormalize,
    uriNormalizeLocalPaths : uriNormalizeLocalPaths,
    uriNormalizeTolerant : uriNormalizeTolerant,
    uriNormalizeLocalPathsTolerant : uriNormalizeLocalPathsTolerant,

    uriRefine : uriRefine,
    urisRefine : urisRefine,
    uriParse : uriParse,
    uriStr : uriStr,
    uriFor : uriFor,
    uriDocument : uriDocument,
    uriServer : uriServer,
    uriQuery : uriQuery,
    uriDequery : uriDequery,
    uriResolve : uriResolve,

    _uriJoin_body : _uriJoin_body,
    uriJoin : uriJoin,

    uriCommonLocalPaths : uriCommonLocalPaths,
    uriCommon : uriCommon,

    uriRebase : uriRebase,

    uriName : uriName,
    uriExt : uriExt,
    uriChangeExt : uriChangeExt,
    uriDir : uriDir

  },

}

Self = wTestSuite( Self );

if( typeof module !== 'undefined' && !module.parent )
_.Tester.test( Self );

} )( );