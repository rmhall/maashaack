/*

  Version: MPL 1.1/GPL 2.0/LGPL 2.1
 
  The contents of this file are subject to the Mozilla Public License Version
  1.1 (the "License"); you may not use this file except in compliance with
  the License. You may obtain a copy of the License at 
  
           http://www.mozilla.org/MPL/ 
  
  Software distributed under the License is distributed on an "AS IS" basis,
  WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
  for the specific language governing rights and limitations under the License. 
  
  The Original Code is VEGAS Framework.
  
  The Initial Developer of the Original Code is
  ALCARAZ Marc (aka eKameleon)  <ekameleon@gmail.com>.
  Portions created by the Initial Developer are Copyright (C) 2004-2010
  the Initial Developer. All Rights Reserved.
  
  Contributor(s) :
  
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

// ---o Constructor

system.numeric.PRNGTest = function( name ) 
{
    buRRRn.ASTUce.TestCase.call( this , name ) ;
}

// ----o Inherit

system.numeric.PRNGTest.prototype             = new buRRRn.ASTUce.TestCase() ;
system.numeric.PRNGTest.prototype.constructor = system.numeric.PRNGTest ;

proto = system.numeric.PRNGTest.prototype ;

// ----o Public Methods

proto.setUp = function()
{
    this.random = new system.numeric.PRNG( 1 ) ;
}

proto.tearDown = function()
{
    this.random = undefined ;
}

proto.testConstructor = function()
{
    this.assertNotNull( this.random , "Constructor failed." ) ;
}

// test random methods (the prng algo is linear, the random value is alway the same (except if we use a random.value = Math.random() * X)

proto.testValue = function()
{
    this.assertEquals( this.random.value , 1 , "value failed." ) ;
}

proto.testValueMax = function()
{
    this.random.value = 0X7FFFFFFE + 1 ;
    this.assertEquals( this.random.value , 0X7FFFFFFE , "max value failed." ) ;
}

proto.testValueMin = function()
{
    this.random.value = 0 ;
    this.assertEquals( this.random.value , 1 , "min value failed." ) ;
}

proto.testToString = function()
{
    this.assertEquals( this.random.toString() , "1" ) ;
}

proto.testValueOf = function()
{
    this.assertEquals( this.random.valueOf() , 1 ) ;
}

//////////

delete proto ;