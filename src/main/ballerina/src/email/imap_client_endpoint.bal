// Copyright (c) 2020 WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Represents an IMAP Client, which interacts with an IMAP Server.
public type ImapClient client object {

    # Gets invoked during object initialization.
    #
    # + clientConfig - Configurations for the IMAP Client
    # + return - An `error` if failed while creating the client
    public function __init(ImapConfig clientConfig) returns error? {
        return initImapClientEndpoint(self, clientConfig, false);
    }

    # Reads a message.
    #
    # + filter - Filter parameters to read an email
    # + return - An `error` if failed to send the message to the recipient
    public remote function read(Filter filter = { folder: "INBOX" }) returns Email|error? {
        return imapRead(self, filter);
    }

};

# Configuration of the IMAP Endpoint.
#
# + host - Host address of the IMAP server
# + port - Port number of the IMAP server
# + ssl - SSL enable
# + username - Username to access the IMAP server
# + password - Password to access the IMAP server
public type ImapConfig record {|
    string host;
    int port = 143;
    boolean ssl = true;
    string username;
    string password;
|};
