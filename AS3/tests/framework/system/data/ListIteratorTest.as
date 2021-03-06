﻿/*
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
  Portions created by the Initial Developers are Copyright (C) 2006-2009
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

package system.data 
{
    import buRRRn.ASTUce.framework.TestCase;
    
    import system.data.samples.ListIteratorClass;    

    public class ListIteratorTest extends TestCase 
    {

        public function ListIteratorTest( name:String = "" )
        {
            super( name );
        }
        
        public var i:ListIteratorClass ;
        
        public function setUp():void
        {
            i = new ListIteratorClass() ;
        }

        public function tearDown():void
        {
            i = undefined ;
        }        
        
        public function testInterface():void
        {
            assertTrue( i is ListIterator ) ;
            assertTrue( i is Iterator ) ;
        }
        
        public function testAdd():void
        {    
            try
            {
                i.add("item") ;
                fail( "01 - test ListIterator interface failed with the add method." ) ;              
            }
            catch( e:Error )
            {
                assertEquals( e.message , "insert:item" , "02 - test ListIterator interface failed with the add method." ) ;
            }
        }     
        
        public function testHasNext():void
        {
            assertTrue( i.hasNext() , "test ListIterator interface failed with the hasNext method." ) ;
        }
        
        public function testHasPrevious():void
        {
            assertTrue( i.hasPrevious() , "test ListIterator interface failed with the hasPrevious method." ) ;
        } 
        
        public function testKey():void
        {
            assertEquals( i.key() , "key" , "test ListIterator interface failed with the key method." ) ;
        }
        
        public function testNext():void
        {
            assertEquals( i.next() , "next" , "test ListIterator interface failed with the next method." ) ;
        }
        
        public function testNextIndex():void
        {
            assertEquals( i.nextIndex() , 0 , "test ListIterator interface failed with the nextIndex method." ) ;
        }        
        
        public function testPrevious():void
        {
            assertEquals( i.previous() , "previous" , "test ListIterator interface failed with the previous method." ) ;
        }
        
        public function testPreviousIndex():void
        {
            assertEquals( i.previousIndex() , 0 , "test ListIterator interface failed with the previousIndex method." ) ;
        }         
        
        public function testRemove():void 
        {
            assertEquals( i.remove() , "remove" , "test ListIterator interface failed with the remove method." ) ;
        }
        
        public function testReset():void
        {    
            try
            {
                i.reset() ;
                fail( "01 - test ListIterator interface failed with the reset method." ) ;              
            }
            catch( e:Error )
            {
                assertEquals( e.message , "reset" , "02 - test ListIterator interface failed with the reset method." ) ;
            }
        }
        
        public function testSeek():void
        {
            try
            {
                i.seek(10) ;
                fail( "02 - test ListIterator interface failed with the seek method." ) ;               
            }
            catch( e:Error )
            {
                assertEquals( e.message , "seek:10" , "02 - test ListIterator interface failed with the seek method." ) ;
            }
        }         
        
        public function testSet():void
        {    
            try
            {
                i.set("item") ;
                fail( "01 - test ListIterator interface failed with the set method." ) ;              
            }
            catch( e:Error )
            {
                assertEquals( e.message , "set:item" , "02 - test ListIterator interface failed with the set method." ) ;
            }
        }             
        
    }
}