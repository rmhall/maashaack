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

package system.numeric 
{
    import buRRRn.ASTUce.framework.TestCase;
    
    public class PRNGTest extends TestCase 
    {
        public function PRNGTest(name:String = "")
        {
            super(name);
        }
        
        public var random:PRNG ;
        
        public function setUp():void
        {
            random = new PRNG( 1 ) ;
         }
        
        public function tearDown():void
        {
            random = null ;
        }
        
        public function testConstructor():void
        {
            assertNotNull( random , "Constructor failed." ) ;
        }
        
        // test random methods (the prng algo is linear, the random value is alway the same (except if we use a random.value = Math.random() * X)
        
        public function testValue():void
        {
            assertEquals( random.value , 1 , "value failed." ) ;
        }
        
        public function testValueMax():void
        {
            random.value = 0X7FFFFFFE + 1 ;
            assertEquals( random.value , 0X7FFFFFFE , "max value failed." ) ;
        }
        
        public function testValueMin():void
        {
            random.value = 0 ;
            assertEquals( random.value , 1 , "min value failed." ) ;
        }
        
        public function testToString():void
        {
            assertEquals( random.toString() , "1" , "toString failed." ) ;
        }
        
        public function testValueOf():void
        {
            assertEquals( random.valueOf() , 1 , "valueOf failed." ) ;
        }
    }
}
