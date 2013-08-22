<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="Firework.Cloud" generation="1" functional="0" release="0" Id="002855ba-9528-4640-8308-fd69f0f169a0" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="Firework.CloudGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Firework.Web:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/Firework.Cloud/Firework.CloudGroup/LB:Firework.Web:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Firework.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Firework.Cloud/Firework.CloudGroup/MapFirework.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="Firework.WebInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/Firework.Cloud/Firework.CloudGroup/MapFirework.WebInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Firework.Web:Endpoint1">
          <toPorts>
            <inPortMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.Web/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapFirework.Web:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.Web/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapFirework.WebInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.WebInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Firework.Web" generation="1" functional="0" release="0" software="C:\Users\bradyg\SkyDrive\Sources\DEMO-RealtimeCommunicationsWithSignalR\code\Firework-End\Firework.Cloud\csx\Debug\roles\Firework.Web" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="1792" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Firework.Web&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Firework.Web&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.WebInstances" />
            <sCSPolicyUpdateDomainMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.WebUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.WebFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="Firework.WebUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="Firework.WebFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="Firework.WebInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="83453ced-d956-4fbd-8bf9-3b49942951f1" ref="Microsoft.RedDog.Contract\ServiceContract\Firework.CloudContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="c607084f-bb10-4675-bf8a-5cb352dcb934" ref="Microsoft.RedDog.Contract\Interface\Firework.Web:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/Firework.Cloud/Firework.CloudGroup/Firework.Web:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>