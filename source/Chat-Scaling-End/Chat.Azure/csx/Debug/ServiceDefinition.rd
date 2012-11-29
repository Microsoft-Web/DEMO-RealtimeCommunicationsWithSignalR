<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="Chat.Azure" generation="1" functional="0" release="0" Id="e127da17-a027-4cec-983b-77d03b826020" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="Chat.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Chat:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/Chat.Azure/Chat.AzureGroup/LB:Chat:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Chat:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Chat.Azure/Chat.AzureGroup/MapChat:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="ChatInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/Chat.Azure/Chat.AzureGroup/MapChatInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Chat:Endpoint1">
          <toPorts>
            <inPortMoniker name="/Chat.Azure/Chat.AzureGroup/Chat/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapChat:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Chat.Azure/Chat.AzureGroup/Chat/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapChatInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/Chat.Azure/Chat.AzureGroup/ChatInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Chat" generation="1" functional="0" release="0" software="C:\Users\bradyg\SkyDrive\Sources\DEMO-RealtimeCommunicationsWithSignalR\code\Chat-Scaling-End\Chat.Azure\csx\Debug\roles\Chat" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Chat&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Chat&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/Chat.Azure/Chat.AzureGroup/ChatInstances" />
            <sCSPolicyUpdateDomainMoniker name="/Chat.Azure/Chat.AzureGroup/ChatUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/Chat.Azure/Chat.AzureGroup/ChatFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="ChatUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="ChatFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="ChatInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="e786f9a6-c2c0-4273-927e-1ed6d347e33b" ref="Microsoft.RedDog.Contract\ServiceContract\Chat.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="56f47ffe-a0de-4c0d-981c-5f08435bfa16" ref="Microsoft.RedDog.Contract\Interface\Chat:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/Chat.Azure/Chat.AzureGroup/Chat:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>