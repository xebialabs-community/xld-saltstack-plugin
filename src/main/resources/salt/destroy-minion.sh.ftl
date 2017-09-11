<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
#!/bin/sh

echo Destroying minion "${previousDeployed.minionName}"
${previousDeployed.container.saltCloudPath}/salt-cloud -d ${previousDeployed.minionName} -y --hard-crash
rc=$?
if [ $rc -ne 0 ]; then
 echo "Failed to detroy minion" >&2
 exit 1
fi
