#!/bin/bash
echo "=== Deep Dive Debugging ==="

echo -e "\n1. Checking API Resources for ArgoCD:"
oc api-resources | grep argoproj

echo -e "\n2. Checking ConfigurationPolicies in local-cluster namespace:"
oc get configurationpolicy -n local-cluster

echo -e "\n3. Checking Details of policy-keycloak-app-config in local-cluster:"
oc get configurationpolicy policy-keycloak-app-config -n local-cluster -o yaml

echo -e "\n4. Checking Events in openshift-gitops namespace:"
oc get events -n openshift-gitops --sort-by='.lastTimestamp' | tail -n 10

echo -e "\n5. Checking for any 'Application' across all namespaces (just in case):"
oc get applications -A

echo -e "\n6. Checking GitOps Operator Pods:"
oc get pods -n openshift-operators -l control-plane=gitops-operator
