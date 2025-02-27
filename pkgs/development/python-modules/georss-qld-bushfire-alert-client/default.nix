{
  lib,
  buildPythonPackage,
  fetchFromGitHub,
  georss-client,
  pytestCheckHook,
  pythonOlder,
  setuptools,
}:

buildPythonPackage rec {
  pname = "georss-qld-bushfire-alert-client";
  version = "0.8";
  pyproject = true;

  disabled = pythonOlder "3.8";

  src = fetchFromGitHub {
    owner = "exxamalte";
    repo = "python-georss-qld-bushfire-alert-client";
    tag = "v${version}";
    hash = "sha256-/MyjYLu29PANe17KxJCkmHPjvjlPfswn7ZBAKFSwohc=";
  };

  build-system = [ setuptools ];

  dependencies = [ georss-client ];

  nativeCheckInputs = [ pytestCheckHook ];

  pythonImportsCheck = [ "georss_qld_bushfire_alert_client" ];

  meta = with lib; {
    description = "Python library for accessing Queensland Bushfire Alert feed";
    homepage = "https://github.com/exxamalte/python-georss-qld-bushfire-alert-client";
    changelog = "https://github.com/exxamalte/python-georss-qld-bushfire-alert-client/releases/tag/v${version}";
    license = with licenses; [ asl20 ];
    maintainers = with maintainers; [ fab ];
  };
}
