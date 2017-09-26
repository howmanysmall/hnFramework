import subprocess
import re

pipe = subprocess.Popen(["git", "ls-files"],
	stdout = subprocess.PIPE,
	stderr = subprocess.PIPE)
