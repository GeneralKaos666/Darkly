#include "darklyconfigwidget.h"
#include <KPluginFactory>

namespace Darkly
{
K_PLUGIN_CLASS_WITH_JSON(ConfigWidget, "kcm_darklydecoration.json")
}

#include "kcm_darklydecoration.moc"
