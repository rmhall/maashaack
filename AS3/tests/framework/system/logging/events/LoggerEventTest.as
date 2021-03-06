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

package system.logging.events 
{
    import buRRRn.ASTUce.framework.TestCase;

    import system.events.LoggerEvent;
    import system.logging.LoggerLevel;

    import flash.events.Event;

    public class LoggerEventTest extends TestCase 
    {
        public function LoggerEventTest(name:String = "")
        {
            super(name);
        }
        
        public function testConstructor():void
        {
            var event:LoggerEvent = new LoggerEvent("test", LoggerLevel.DEBUG ) ;
            assertNotNull( event , "01 - constructor failed.") ;
            assertEquals(event.message , "test" , "02 - constructor failed.") ;
            assertEquals(event.level   , LoggerLevel.DEBUG , "02 - constructor failed.") ;
        }
        
        public function testInherit():void
        {
            var event:LoggerEvent = new LoggerEvent("test", LoggerLevel.DEBUG ) ;
            assertTrue( event is Event   , "Must inherit Event.") ;
        }
        
        public function testDEFAULT_LEVEL_STRING():void
        {
            assertEquals( LoggerEvent.DEFAULT_LEVEL_STRING  , "UNKNOWN" , "DEFAULT_LEVEL_STRING static property failed.") ;
        }
        
        public function testLOG():void
        {
            assertEquals( LoggerEvent.LOG  , "log" , "LOG static constant failed.") ;
        }
        
        public function testLevel():void
        {
            var event:LoggerEvent = new LoggerEvent("test", LoggerLevel.DEBUG ) ;
            assertEquals(event.level , LoggerLevel.DEBUG , "level property failed.") ;
        }
        
        public function testMessage():void
        {
            var event:LoggerEvent = new LoggerEvent("test", LoggerLevel.DEBUG ) ;
            assertEquals(event.message , "test" , "message property failed.") ;
        }
        
        public function testClone():void
        {
            var event:LoggerEvent = new LoggerEvent("test", LoggerLevel.DEBUG ) ;
            var clone:LoggerEvent = event.clone() as LoggerEvent ;
            assertNotNull( clone , "01 - clone method failed." ) ;
            assertEquals(event.message , clone.message , "02 - clone method failed." ) ;
            assertEquals(event.level   , clone.level   , "03 - clone method failed." ) ;
        }
        
        public function testGetLevelString():void
        {
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.ALL   ) , "ALL"   , "01 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.DEBUG ) , "DEBUG" , "02 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.ERROR ) , "ERROR" , "03 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.FATAL ) , "FATAL" , "04 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.INFO  ) , "INFO"  , "05 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( LoggerLevel.WARN  ) , "WARN"  , "06 - LoggerEvent.getLevelString() failed." ) ;
            assertEquals( LoggerEvent.getLevelString( new LoggerLevel(55,"TEST") )  , "UNKNOWN" , "07 - LoggerEvent.getLevelString() failed." ) ;
        }
    }
}
