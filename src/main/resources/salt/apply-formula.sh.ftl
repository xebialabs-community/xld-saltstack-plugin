<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
#!/bin/sh
echo Copying forumla ${deployed.formulaName} to states directory "${deployed.container.statesDir}"
test -d "${deployed.container.statesDir}" || mkdir -p "${deployed.container.statesDir}" && tar -xf ${deployed.file.path} -C ${deployed.container.statesDir}

echo Applying state file: "${deployed.formulaName}"
${deployed.container.saltCallPath}/salt-call --local --states-dir=${deployed.container.statesDir} state.apply ${deployed.formulaName} --retcode-passthrough
rc=$?
if [ $rc -ne 0 ]; then
 echo "Failed to apply state file" >&2
 exit 1
fi
