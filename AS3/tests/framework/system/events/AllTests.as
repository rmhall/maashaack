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

package system.events
{
    import buRRRn.ASTUce.framework.*;
    
    import system.Environment;
    import system.hosts.HostID;
    
    public class AllTests
    {
        public static function suite():ITest
        {
            var suite:TestSuite = new TestSuite("Maashaack events model based W3C dom 2/3 tests");
            if( Environment.host.id != HostID.RedTamarin )
            {
                suite.addTestSuite( ActionEventTest ) ;
                suite.addTestSuite( ArrayEventTest ) ;
                suite.addTestSuite( BasicEventTest ) ;
                suite.addTestSuite( BooleanEventTest ) ;
                suite.addTestSuite( BroadcasterTest ) ;
                suite.addTestSuite( CommandTest ) ;
                suite.addTestSuite( InternalBroadcasterTest ) ;
                suite.addTestSuite( CoreBroadcasterTest ) ;
                suite.addTestSuite( CoreEventDispatcherTest ) ;
                suite.addTestSuite( DateEventTest ) ;
                suite.addTestSuite( DelegateTest ) ;
                suite.addTestSuite( DynamicEventTest ) ;
                suite.addTestSuite( EventDispatcherTest ) ;
                suite.addTestSuite( EventListenerTest ) ;
                suite.addTestSuite( EventListenerBatchTest ) ;
                suite.addTestSuite( FastDispatcherTest ) ;
                suite.addTestSuite( FrontControllerTest ) ;
                suite.addTestSuite( IEventDispatcherTest ) ;
                suite.addTestSuite( InternalDispatcherTest ) ;
                suite.addTestSuite( MessageBroadcasterTest ) ;
                suite.addTestSuite( NumberEventTest ) ;
                suite.addTestSuite( StringEventTest ) ;
            }
            return suite;
        }
    }
}
