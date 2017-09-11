<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
#!/bin/sh

echo Creating minion "${deployed.minionName}" using salt-cloud with profile "${deployed.profileName}"
${deployed.container.saltCloudPath}/salt-cloud -p ${deployed.profileName} ${deployed.minionName} --hard-crash
rc=$?
if [ $rc -ne 0 ]; then
 echo "Failed to create minion" >&2
 exit 1
fi
