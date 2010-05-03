/*
  Version: MPL 1.1/GPL 2.0/LGPL 2.1
 
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at
  http://www.mozilla.org/MPL/
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the
  License.
  
  The Original Code is [maashaack framework].
  
  The Initial Developers of the Original Code are
  Zwetan Kjukov <zwetan@gmail.com> and Marc Alcaraz <ekameleon@gmail.com>.
  Portions created by the Initial Developers are Copyright (C) 2006-2010
  the Initial Developers. All Rights Reserved.
  
  Contributor(s):
  
  Alternatively, the contents of this file may be used under the terms of
  either the GNU General Public License Version 2 or later (the "GPL"), or
  the GNU Lesser General Public License Version 2.1 or later (the "LGPL"),
  in which case the provisions of the GPL or the LGPL are applicable instead
  of those above. If you wish to allow use of your version of this file only
  under the terms of either the GPL or the LGPL, and not to allow others to
  use your version of this file under the terms of the MPL, indicate your
  decision by deleting the provisions above and replace them with the notice
  and other provisions required by the LGPL or the GPL. If you do not delete
  the provisions above, a recipient may use your version of this file under
  the terms of any one of the MPL, the GPL or the LGPL.
*/

package core
{
    /**
    * Dumps a string representation of any object reference.
    * 
    * <p>
    * Works like the <code>eden.serialize()</code> function
    * and supports the <code>toSource()</code> method.
    * </p>
    * 
    * @example basic usage
    * <listing version="3.0">
    * <code class="prettyprint">
    * var test0:Object = { a:1, b:2, c:null, d:undefined, e:[1,2,3], f:"hello world", g:new Date() };
    * 
    * trace( dump( test0 ) );
    * 
    * //output
    * //{a:1,b:2,c:null,d:undefined,e:[1,2,3],f:"hello world",g:new Date(2010,4,3,20,35,7,860)}
    * 
    * trace( dump( test0, true ) );
    * 
    * //output
    * // {
    * //     a:1,
    * //     b:2,
    * //     c:null,
    * //     d:undefined,
    * //     e:
    * //     [
    * //         1,
    * //         2,
    * //         3
    * //     ],
    * //     f:"hello world",
    * //     g:new Date(2010,4,3,20,35,7,860)
    * // }
    * 
    * </code>
    * </listing>
    * 
    * @param o an object reference
    * @param prettyprint (optional) boolean option to output a pretty printed string
    * @param indent (optional) initial indentation
    * @param indentor (optional) initial string used for the indent
    */
    public const dump:Function = function( o:*, prettyprint:Boolean = false, indent:int = 0, indentor:String = "    " ):String
    {
        var idr:String = indentor;
        
        var _dumpDate:Function = function( value:Date ):String
        {
            var data:Array;
            
            var y:Number = value.getFullYear( );
            var m:Number = value.getMonth( );
            var d:Number = value.getDate( );
            var h:Number = value.getHours( );
            var mn:Number = value.getMinutes( );
            var s:Number = value.getSeconds( );
            var ms:Number = value.getMilliseconds( );
            
            data = [ y, m, d, h, mn, s, ms ];
            data.reverse( );
            
            while( data[0] == 0 )
            {
                data.splice( 0, 1 );
            }
            
            data.reverse( );
            
            return "new Date(" + data.join( "," ) + ")";
        }
        
        var _dumpString:Function = function( value:String ):String
        {
            var quote:String = "\"";
            var str:String = "";
            var ch:String = "";
            var pos:int = 0;
            var code:int;
            
            var _toUnicodeNotation:Function = function( num:int ):String
            {
                var hex:String = num.toString( 16 );
                while( hex.length < 4 )
                {
                    hex = "0" + hex;
                }
                return hex;
            };
            
            while( pos < value.length )
            {
                ch = value.charAt( pos );
                code = value.charCodeAt( pos );
                
                if( code > 0xFF )
                {
                    str += "\\u" + _toUnicodeNotation( code );
                    pos++;
                    continue;
                }
                
                switch( ch )
                {
                    case "\u0008": 
                        //backspace
                        str += "\\b";
                        break;
                    
                    case "\u0009": 
                        //horizontal tab
                        str += "\\t";
                        break;
                    
                    case "\u000A": 
                        //line feed
                        str += "\\n";
                        break;
                    
                    case "\u000B": 
                        //vertical tab
                        str += "\\v";
                        /* TODO: check the VT bug */
                        //str += "\\u000B";
                        break;
                    
                    case "\u000C": 
                        //form feed
                        str += "\\f";
                        break;
                    
                    case "\u000D": 
                        //carriage return
                        str += "\\r";
                        break;
                    
                    case "\u0022": 
                        //double quote
                        str += "\\\"";
                        break;
                    
                    case "\u0027": 
                        //single quote
                        str += "\\\'";
                        break;
                    
                    case "\u005c": 
                        //backslash
                        str += "\\\\";
                        break;
                    
                    default:
                        str += ch;
                }
                
                pos++;
            }
            
            return quote + str + quote;
        }
        
        var _dumpArray:Function = function( value:Array ):String
        {
            var source:Array = [];
            var size:uint = value.length ;                
            for( var i:int = 0 ; i < size ; i++ )
            {
                
                if( value[i] === undefined )
                {
                    source.push( "undefined" );
                    continue;
                }
                
                if( value[i] === null )
                {
                    source.push( "null" );
                    continue;
                }
                
                if( prettyprint ) { indent++; }
                source.push( dump( value[i], prettyprint, indent, idr ) );
                if( prettyprint ) { indent--; }
            }
            
            if( !prettyprint ) { return( "[" + source.join( "," ) + "]" ); }
            
            var spaces:Array = [];
            for( var j:int; j<indent; j++ )
            {
                spaces.push( idr );
            }
            
            var decal:String = "\n" + spaces.join( "" );
            return decal + "[" + decal + idr + source.join( "," + decal + idr ) + decal + "]";
        }
        
        var _dumpObject:Function = function( value:Object ):String
        {
            var source:Array = [];
            
            for( var member:String in value )
            {
                if( value.hasOwnProperty( member ) )
                {
                    if( value[member] === undefined )
                    {
                        source.push( member + ":" + "undefined" );
                        continue;
                    }
                    
                    if( value[member] === null )
                    {
                        source.push( member + ":" + "null" );
                        continue;
                    }
                    
                    if( prettyprint ) { indent++; }
                    source.push( member + ":" + dump( value[member], prettyprint, indent, idr ) );
                    if( prettyprint ) { indent--; }
                }
            }
            
            source = source.sort();
            
            if( !prettyprint ) { return( "{" + source.join( "," ) + "}" ); }
            
            var spaces:Array = [];
            for( var j:int; j<indent; j++ )
            {
                spaces.push( idr );
            }
            
            var decal:String = "\n" + spaces.join( "" );
            return decal + "{" + decal + idr + source.join( "," + decal + idr ) + decal + "}";
        }
        
        if( o === undefined ) { return "undefined"; }
        
        if( o === null ) { return "null"; }
        
        if( o.hasOwnProperty( "toSource" ) ) { return o.toSource( indent ); }
        
        if( o is String ) { return _dumpString( o ); }
        
        if( o is Boolean ) { return o ? "true" : "false"; }
        
        if( o is Number ) { return o.toString(); }
        
        if( o is Date ) { return _dumpDate( o ); }
        
        if( o is Array ) { return _dumpArray( o ); }
        
        if( o is Object ) { return _dumpObject( o ); }
        
        return "<unknown>";
    }
    
}